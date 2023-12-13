﻿//
//  WinCompose — a compose key for Windows — http://wincompose.info/
//
//  Copyright © 2013—2019 Sam Hocevar <sam@hocevar.net>
//
//  This program is free software. It comes without any warranty, to
//  the extent permitted by applicable law. You can redistribute it
//  and/or modify it under the terms of the Do What the Fuck You Want
//  to Public License, Version 2, as published by the WTFPL Task Force.
//  See http://www.wtfpl.net/ for more details.
//

using System.Collections.Generic;
using System.ComponentModel;
using System.IO;
using System.Xml;
using System.Xml.Schema;
using System.Xml.Serialization;

namespace WinCompose
{
    public struct SequenceIdentifier
    {
        public SequenceIdentifier(KeySequence sequence, string result)
        {
            Sequence = sequence;
            Result = result;
        }

        public readonly KeySequence Sequence;
        public readonly string Result;
    }

    public class Data
    {
        public bool Favorite;

        public int UsageCount;
    }

    public class MetadataDB : Dictionary<SequenceIdentifier, Data>, IXmlSerializable
    {
        public Data TryGet(KeySequence sequence, string result)
        {
            var key = new SequenceIdentifier(sequence, result);
            TryGetValue(key, out var ret);
            return ret;
        }

        public Data GetOrAdd(KeySequence sequence, string result)
        {
            var key = new SequenceIdentifier(sequence, result);
            if (!TryGetValue(key, out var ret))
                Add(key, ret = new Data());
            return ret as Data;
        }

        #region IXmlSerializable
        public void WriteXml(XmlWriter writer)
        {
            foreach (var kv in this)
            {
                writer.WriteStartElement("Item");
                writer.WriteAttributeString("Seq", kv.Key.Sequence.AsXmlAttr);
                writer.WriteAttributeString("Result", kv.Key.Result.ToString());
                writer.WriteAttributeString("Favorite", kv.Value.Favorite.ToString());
                writer.WriteAttributeString("UsageCount", kv.Value.UsageCount.ToString());
                writer.WriteEndElement();
            }
        }

        public void ReadXml(XmlReader reader)
        {
            var cv = TypeDescriptor.GetConverter(typeof(KeySequence));

            while (reader.Read())
            {
                KeySequence seq;

                if (reader.NodeType != XmlNodeType.Element || reader.Name != "Item")
                    continue;

                var result = reader.GetAttribute("Result");
                if (result == null)
                    continue;

                var in_attr = reader.GetAttribute("Seq");
                if (in_attr == null)
                {
                    // Backward compatibility with 0.9.3
                    var seq_attr = reader.GetAttribute("Sequence");
                    if (seq_attr == null)
                        continue;

                    seq = cv.ConvertFromString(seq_attr) as KeySequence;
                }
                else
                {
                    seq = KeySequence.FromXmlAttr(in_attr);
                }

                var data = GetOrAdd(seq, result);
                bool.TryParse(reader.GetAttribute("Favorite") ?? "false", out data.Favorite);
                int.TryParse(reader.GetAttribute("UsageCount") ?? "0", out data.UsageCount);
            }
        }

        public XmlSchema GetSchema() => null;
        #endregion
    }

    public static class Metadata
    {
        public static void IncrementUsage(KeySequence sequence, string result)
        {
            var data = m_dict.GetOrAdd(sequence, result);
            ++data.UsageCount;
        }

        public static void ToggleFavorite(KeySequence sequence, string result)
        {
            var data = m_dict.GetOrAdd(sequence, result);
            data.Favorite = !data.Favorite;
            SaveDB();
        }

        public static bool IsFavorite(KeySequence sequence, string result)
            => m_dict.TryGet(sequence, result)?.Favorite ?? false;

        public static void LoadDB()
        {
            m_dict = m_xml.Load<MetadataDB>();
        }

        public static void SaveDB()
        {
            m_xml.Save(m_dict);
        }

        private static XmlFile m_xml
            = new XmlFile(Path.Combine(Utils.AppDataDir, "metadata.xml"));

        private static MetadataDB m_dict = new MetadataDB();
    }
}

