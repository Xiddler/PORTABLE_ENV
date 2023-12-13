﻿//
//  WinCompose — a compose key for Windows — http://wincompose.info/
//
//  Copyright © 2013—2021 Sam Hocevar <sam@hocevar.net>
//
//  This program is free software. It comes without any warranty, to
//  the extent permitted by applicable law. You can redistribute it
//  and/or modify it under the terms of the Do What the Fuck You Want
//  to Public License, Version 2, as published by the WTFPL Task Force.
//  See http://www.wtfpl.net/ for more details.
//

using System;
using System.Collections.Generic;
using System.IO;
using System.Text.RegularExpressions;

namespace WinCompose
{

/// <summary>
/// The SequenceTree class contains a tree of all valid sequences.
/// </summary>
public class SequenceTree : SequenceNode
{
    public void LoadFile(string path)
    {
        try
        {
            using (StreamReader s = new StreamReader(path))
            {
                Logger.Info($"Loaded rule file {path}");
                m_loaded_files.Add(path);
                LoadStream(s);
            }
        }
        catch (FileNotFoundException)
        {
            Logger.Info($"Rule file {path} not found");
        }
        catch (Exception ex)
        {
            Logger.Warn(ex, $"Cannot load rule file {path}");
        }
    }

    public void LoadResource(string resource)
    {
        using (var sr = new GZipResourceStream(resource))
        {
            Logger.Info($"Loaded rule resource {resource}");
            LoadStream(sr);
        }
    }

    public void Clear()
    {
        m_children.Clear();
        m_loaded_files.Clear();
        m_invalid_keys.Clear();
        Count = 0;
    }

    public int Count { get; private set; }

    private void LoadStream(StreamReader s)
    {
        Regex match_comment = new Regex(@"/\*([^*]|\*[^/])*\*/");

        /* Read file and remove all C comments */
        string buffer = s.ReadToEnd();
        buffer = match_comment.Replace(buffer, "");

        /* Parse all lines */
        foreach (string line in buffer.Split('\r', '\n'))
            ParseRule(line);
    }

    private static Regex m_r0 = new Regex(@"^\s*include\s*""([^""]*)""");
    private static Regex m_r1 = new Regex(@"^\s*(<:>|<[^:]*>\s*)*:\s*(""(\\""|\\.|[^""])*""|[A-Za-z0-9_]*)[^#]*#?\s*(.*)");
        //                                      ^^^^^^^^^^^^^^^^^     ^^^^^^^^^^^^^^^^^^^^^ ^^^^^^^^^^^^^           ^^^^
        //                                            keys                result 1         result 2             desc

    // Split along "^<", ">$", or "> <" to capture tag contents
    private static Regex m_r2 = new Regex(@"(?:^\s*<|>\s*<|>\s*$)");

    private void ParseRule(string line)
    {
        // If this is an include directive, use LoadFile() again
        Match m0 = m_r0.Match(line);
        if (m0.Success)
        {
            string file = m0.Groups[1].Captures[0].Value;

            // We support %H (user directory) but not %L (locale-specific dir)
            if (file.Contains("%L"))
                return;
            file = file.Replace("%H", Utils.UserDir);

            // Also if path is not absolute, prepend user directory
            if (!Path.IsPathRooted(file))
                file = Path.Combine(Utils.UserDir, file);

            // Prevent against include recursion
            if (!m_loaded_files.Contains(file))
                LoadFile(file);

            return;
        }

        var m1 = m_r1.Match(line);
        if (!m1.Success)
            return;

        KeySequence seq = new KeySequence();
        var keysyms = m_r2.Split(m1.Groups[1].Captures[0].Value);

        for (int i = 1; i < keysyms.Length - 1; ++i)
        {
            Key k = Key.FromKeySymOrChar(keysyms[i]);
            if (k == null)
            {
                if (m_invalid_keys.Add(keysyms[i]))
                    Logger.Warn($"Unknown key name <{keysyms[i]}>, ignoring sequence");
                return; // Unknown key name! Better bail out
            }

            seq.Add(k);
        }

        // Only bother with sequences of length >= 2 that start with <Multi_key>
        if (seq.Count < 2 || seq[0].VirtualKey != VK.COMPOSE)
            return;

        string result = m1.Groups[2].Captures[0].Value;
        if (result[0] == '"')
        {
            result = result.Trim('"');
            // Unescape \n \\ \" and more in the string output
            result = Regex.Replace(result, @"\\([0-7]{3}|0x[0-7a-fA-F]{4}|.)", m =>
            {
                var s = m.Value;

                if (s.Length == 4) // Octal escape
                    return ((char)Convert.ToInt32(s.Substring(1), 8)).ToString();

                if (s.Length == 7) // Hex escape
                    return ((char)Convert.ToInt32(s.Substring(3), 16)).ToString();

                switch (s[1])
                {
                    // These sequences are converted to their known value
                    case 'n': return "\n";
                    case 'r': return "\r";
                    case 't': return "\t";
                    case '"': return "\"";
                    case '\\': return "\\";
                    default: return s;
                }
            });
        }
        else
        {
            var result_key = Key.FromKeySymOrChar(result);
            if (result_key == null)
            {
                Logger.Warn($"Unknown key name {result}, ignoring sequence");
                return;
            }
            result = result_key.PrintableResult;
        }
        string description = m1.Groups.Count >= 5 ? m1.Groups[4].Captures[0].Value : "";

        // Try to translate the description if appropriate
        int utf32 = StringToCodepoint(result);
        if (utf32 >= 0)
        {
            string key = $"U{utf32:X04}";
            string alt_desc = unicode.Char.ResourceManager.GetString(key);
            if (!string.IsNullOrEmpty(alt_desc))
                description = alt_desc;
        }

        // HACK: remove the first key (Multi_key) for now, because the
        // rest of the code cannot handle it.
        seq.RemoveAt(0);

        InsertSequence(seq, result, utf32, description);
        ++Count;
    }

    private int StringToCodepoint(string s)
    {
        if (s.Length == 1)
            return (int)s[0];

        if (s.Length == 2 && char.IsHighSurrogate(s, 0) && char.IsLowSurrogate(s, 1))
            return char.ConvertToUtf32(s[0], s[1]);

        return -1;
    }

    private IList<string> m_loaded_files = new List<string>();
    private HashSet<string> m_invalid_keys = new HashSet<string>();

    private static NLog.ILogger Logger = NLog.LogManager.GetCurrentClassLogger();
}

/// <summary>
/// The SequenceNode class contains a subtree of all valid sequences, where
/// each child is indexed by the sequence key.
/// Some functions such as <see cref="IsValidPrefix"/> also work to query
/// the special Unicode entry mode.
/// </summary>
public class SequenceNode
{
    public void InsertSequence(KeySequence sequence, string result, int utf32, string desc)
        => InsertSequence(sequence, new SequenceDescription()
            {
                Sequence = sequence,
                Result = result,
                Utf32 = utf32,
                Description = desc,
            });

    private void InsertSequence(KeySequence path, SequenceDescription item)
    {
        if (path.Count == 0)
        {
            // If this is a conflict, warn about it
            if (m_results.Count > 0 && m_results[0].Result != item.Result)
                Logger.Warn($"Conflicting sequence for {item.Sequence.FriendlyName}: had {m_results[0].Result}, got {item.Result}");

            // Insert sequence at index 0 to give precedence to user sequences
            m_results.Insert(0, item);
            return;
        }

        if (!m_children.TryGetValue(path[0], out var child))
            m_children.Add(path[0], child = new SequenceNode());

        child.InsertSequence(path.GetRange(1, path.Count - 1), item);
    }

    public bool IsValidPrefix(KeySequence sequence, bool ignore_case)
    {
        Search flags = Search.Prefixes;
        if (ignore_case)
            flags |= Search.IgnoreCase;

        // Check if the sequence prefix exists in our tree
        return GetSubtree(sequence, flags) != null;
    }

    public bool IsValidSequence(KeySequence sequence, bool ignore_case)
    {
        Search flags = Search.Sequences;
        if (ignore_case)
            flags |= Search.IgnoreCase;

        // Check if the sequence exists in our tree
        return GetSubtree(sequence, flags) != null;
    }

    public string GetSequenceResult(KeySequence sequence, bool ignore_case)
    {
        Search flags = Search.Sequences;
        if (ignore_case)
            flags |= Search.IgnoreCase;

        // Check if the sequence exists in our tree
        SequenceNode subtree = GetSubtree(sequence, flags);
        if (subtree != null && subtree.m_results.Count > 0)
            return subtree.m_results[0].Result;

        return "";
    }

    /// <summary>
    /// List all possible sequences for the GUI.
    /// </summary>
    public List<SequenceDescription> GetSequenceDescriptions()
    {
        List<SequenceDescription> ret = new List<SequenceDescription>();
        BuildSequenceDescriptions(ret, new KeySequence());
        ret.Sort();
        return ret;
    }

    [Flags]
    private enum Search
    {
        Sequences  = 1,
        Prefixes   = 2,
        IgnoreCase = 4,
    };

    /// <summary>
    /// If the first key of <see cref="sequences"/> matches a known child,
    /// return that child. Otherwise, return null.
    /// If <see cref="flags"/> has the <see cref="Search.Prefixes"/> flag
    /// and we are a rule with no children, we return null. This lets us
    /// check for strict prefixes.
    /// If <see cref="flags"/> has the <see cref="Search.Sequences"/> flag
    /// and we are not a rule (just a node in the tree), we do not return
    /// the current node (but we do return children sequences).
    /// </summary>
    private SequenceNode GetSubtree(KeySequence sequence, Search flags)
    {
        if (sequence.Count == 0)
        {
            if ((flags & Search.Prefixes) != 0 && m_children.Count == 0)
                return null;
            if ((flags & Search.Sequences) != 0 && m_results.Count == 0)
                return null;
            return this;
        }

        KeySequence keys = new KeySequence{ sequence[0] };
        if ((flags & Search.IgnoreCase) != 0 && sequence[0].IsPrintable)
        {
            Key upper = new Key(sequence[0].PrintableResult.ToUpper());
            if (upper != sequence[0])
                keys.Add(upper);

            Key lower = new Key(sequence[0].PrintableResult.ToLower());
            if (lower != sequence[0])
                keys.Add(lower);
        }

        foreach (Key k in keys)
        {
            if (!m_children.ContainsKey(k))
                continue;

            var subsequence = sequence.GetRange(1, sequence.Count - 1);
            var subtree = m_children[k].GetSubtree(subsequence, flags);
            if (subtree != null)
                return subtree;
        }

        return null;
    }

    /// <summary>
    /// Build a list of sequence descriptions by recursively adding our
    /// children to <see cref="list"/>. The output structure is suitable
    /// for the GUI.
    /// </summary>
    private void BuildSequenceDescriptions(List<SequenceDescription> list,
                                           KeySequence path)
    {
        list.AddRange(m_results);

        foreach (var pair in m_children)
        {
            var newpath = new KeySequence(path);
            newpath.Add(pair.Key);
            pair.Value.BuildSequenceDescriptions(list, newpath);
        }
    }

    protected IDictionary<Key, SequenceNode> m_children
        = new Dictionary<Key, SequenceNode>();
    private IList<SequenceDescription> m_results
        = new List<SequenceDescription>();

    private static NLog.ILogger Logger = NLog.LogManager.GetCurrentClassLogger();
};

}
