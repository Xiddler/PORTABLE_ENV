# Opened 2024-06-02


# rg

## Print the filenames that contain the "pattern"

->% cd ~/REPOS/sample_files 

->% rg -l "stepladder" .

Output
./Take_five_chimpanzees.txt
./duplicates/Take_five_chimpanzees.txt

## use rg with fzf

example: search for files containing the word 'metavar' 
->% rg -d 1 'metavar' | fzf

# ------------------------------------
# FULL rg HELP FILE
# ------------------------------------
# ripgrep 14.1.0

Andrew Gallant <jamslam@gmail.com>

ripgrep (rg) recursively searches the current directory for lines matching
a regex pattern. By default, ripgrep will respect gitignore rules and
automatically skip hidden files/directories and binary files.

Use -h for short descriptions and --help for more details.

Project home page: https://github.com/BurntSushi/ripgrep

# USAGE:

    rg [OPTIONS] PATTERN [PATH ...]
    rg [OPTIONS] -e PATTERN ... [PATH ...]
    rg [OPTIONS] -f PATTERNFILE ... [PATH ...]
    rg [OPTIONS] --files [PATH ...]
    rg [OPTIONS] --type-list
    command | rg [OPTIONS] PATTERN
    rg [OPTIONS] --help
    rg [OPTIONS] --version

# POSITIONAL ARGUMENTS:

    <PATTERN>

        A regular expression used for searching. To match a pattern beginning
        with a dash, use the -e/--regexp flag.

        For example, to search for the literal '-foo', you can use this flag:

            rg -e -foo

        You can also use the special '--' delimiter to indicate that no more
        flags will be provided. Namely, the following is equivalent to the
        above:

            rg -- -foo

    <PATH>...
        A file or directory to search. Directories are searched recursively.
        File paths specified on the command line override glob and ignore
        rules.

# INPUT OPTIONS:

    -e PATTERN, --regexp=PATTERN

        A pattern to search for. This option can be provided multiple times,
        where all patterns given are searched, in addition to any patterns
        provided by -f/--file. Lines matching at least one of the provided
        patterns are printed. This flag can also be used when searching for
        patterns that start with a dash.

        For example, to search for the literal -foo:

            rg -e -foo

        You can also use the special -- delimiter to indicate that no more
        flags will be provided. Namely, the following is equivalent to the
        above:

            rg -- -foo

        When -f/--file or -e/--regexp is used, then ripgrep treats all
        positional arguments as files or directories to search.

    -f PATTERNFILE, --file=PATTERNFILE
        Search for patterns from the given file, with one pattern per line.
        When this flag is used multiple times or in combination with the
        -e/--regexp flag, then all patterns provided are searched. Empty
        pattern lines will match all input lines, and the newline is not
        counted as part of the pattern.

        A line is printed if and only if it matches at least one of the
        patterns.

        When PATTERNFILE is -, then stdin will be read for the patterns.

        When -f/--file or -e/--regexp is used, then ripgrep treats all
        positional arguments as files or directories to search.

    --pre=COMMAND
        For each input PATH, this flag causes ripgrep to search the standard
        output of COMMAND PATH instead of the contents of PATH. This option
        expects the COMMAND program to either be a path or to be available in
        your PATH. Either an empty string COMMAND or the --no-pre flag will
        disable this behavior.

        WARNING: When this flag is set, ripgrep will unconditionally spawn a
        process for every file that is searched. Therefore, this can incur an
        unnecessarily large performance penalty if you don't otherwise need the
        flexibility offered by this flag. One possible mitigation to this is to
        use the --pre-glob flag to limit which files a preprocessor is run
        with.

        A preprocessor is not run when ripgrep is searching stdin.

        When searching over sets of files that may require one of several
        preprocessors, COMMAND should be a wrapper program which first
        classifies PATH based on magic numbers/content or based on the PATH
        name and then dispatches to an appropriate preprocessor. Each COMMAND
        also has its standard input connected to PATH for convenience.

        For example, a shell script for COMMAND might look like:

            case "$1" in
            *.pdf)
                exec pdftotext "$1" -
                ;;
            *)
                case $(file "$1") in
                *Zstandard*)
                    exec pzstd -cdq
                    ;;
                *)
                    exec cat
                    ;;
                esac
                ;;
            esac

        The above script uses pdftotext to convert a PDF file to plain text.
        For all other files, the script uses the file utility to sniff the type
        of the file based on its contents. If it is a compressed file in the
        Zstandard format, then pzstd is used to decompress the contents to
        stdout.

        This overrides the -z/--search-zip flag.

    --pre-glob=GLOB

        This flag works in conjunction with the --pre flag. Namely, when one or
        more --pre-glob flags are given, then only files that match the given
        set of globs will be handed to the command specified by the --pre flag.
        Any non-matching files will be searched without using the preprocessor
        command.

        This flag is useful when searching many files with the --pre flag.
        Namely, it provides the ability to avoid process overhead for files
        that don't need preprocessing. For example, given the following shell
        script, pre-pdftotext:

            #!/bin/sh
            pdftotext "$1" -

        then it is possible to use --pre pre-pdftotext --pre-glob '*.pdf' to
        make it so ripgrep only executes the pre-pdftotext command on files
        with a .pdf extension.

        Multiple --pre-glob flags may be used. Globbing rules match gitignore
        globs. Precede a glob with a ! to exclude it.

        This flag has no effect if the --pre flag is not used.

    -z, --search-zip
        This flag instructs ripgrep to search in compressed files. Currently
        gzip, bzip2, xz, LZ4, LZMA, Brotli and Zstd files are supported. This
        option expects the decompression binaries (such as gzip) to be
        available in your PATH. If the required binaries are not found, then
        ripgrep will not emit an error messages by default. Use the --debug
        flag to see more information.

        Note that this flag does not make ripgrep search archive formats as
        directory trees. It only makes ripgrep detect compressed files and then
        decompress them before searching their contents as it would any other
        file.

        This overrides the --pre flag.

        This flag can be disabled with --no-search-zip.

# SEARCH OPTIONS:

    -s, --case-sensitive
        Execute the search case sensitively. This is the default mode.

        This is a global option that applies to all patterns given to ripgrep.
        Individual patterns can still be matched case insensitively by using
        inline regex flags. For example, (?i)abc will match abc case
        insensitively even when this flag is used.

        This flag overrides the -i/--ignore-case and -S/--smart-case flags.

    --crlf
        When enabled, ripgrep will treat CRLF (\r\n) as a line terminator
        instead of just \n.

        Principally, this permits the line anchor assertions ^ and $ in regex
        patterns to treat CRLF, CR or LF as line terminators instead of just
        LF. Note that they will never match between a CR and a LF. CRLF is
        treated as one single line terminator.

        When using the default regex engine, CRLF support can also be enabled
        inside the pattern with the R flag. For example, (?R:$) will match just
        before either CR or LF, but never between CR and LF.

        This flag overrides --null-data.

        This flag can be disabled with --no-crlf.

    --dfa-size-limit=NUM+SUFFIX?
        The upper size limit of the regex DFA. The default limit is something
        generous for any single pattern or for many smallish patterns. This
        should only be changed on very large regex inputs where the (slower)
        fallback regex engine may otherwise be used if the limit is reached.

        The input format accepts suffixes of K, M or G which correspond to
        kilobytes, megabytes and gigabytes, respectively. If no suffix is
        provided the input is treated as bytes.

    -E ENCODING, --encoding=ENCODING
        Specify the text encoding that ripgrep will use on all files searched.
        The default value is auto, which will cause ripgrep to do a best effort
        automatic detection of encoding on a per-file basis. Automatic
        detection in this case only applies to files that begin with a UTF-8 or
        UTF-16 byte-order mark (BOM). No other automatic detection is
        performed. One can also specify none which will then completely disable
        BOM sniffing and always result in searching the raw bytes, including a
        BOM if it's present, regardless of its encoding.

        Other supported values can be found in the list of labels here:
        https://encoding.spec.whatwg.org/#concept-encoding-get.

        For more details on encoding and how ripgrep deals with it, see
        GUIDE.md.

        The encoding detection that ripgrep uses can be reverted to its
        automatic mode via the --no-encoding flag.

    --engine=ENGINE
        Specify which regular expression engine to use. When you choose a regex
        engine, it applies that choice for every regex provided to ripgrep
        (e.g., via multiple -e/--regexp or -f/--file flags).

        Accepted values are default, pcre2, or auto.

        The default value is default, which is usually the fastest and should
        be good for most use cases. The pcre2 engine is generally useful when
        you want to use features such as look-around or backreferences. auto
        will dynamically choose between supported regex engines depending on
        the features used in a pattern on a best effort basis.

        Note that the pcre2 engine is an optional ripgrep feature. If PCRE2
        wasn't included in your build of ripgrep, then using this flag will
        result in ripgrep printing an error message and exiting.

        This overrides previous uses of the -P/--pcre2 and --auto-hybrid-regex
        flags.

    -F, --fixed-strings
        Treat all patterns as literals instead of as regular expressions. When
        this flag is used, special regular expression meta characters such as
        .(){}*+ should not need be escaped.

        This flag can be disabled with --no-fixed-strings.

    -i, --ignore-case
        When this flag is provided, all patterns will be searched case
        insensitively. The case insensitivity rules used by ripgrep's default
        regex engine conform to Unicode's "simple" case folding rules.

        This is a global option that applies to all patterns given to ripgrep.
        Individual patterns can still be matched case sensitively by using
        inline regex flags. For example, (?-i)abc will match abc case
        sensitively even when this flag is used.

        This flag overrides -s/--case-sensitive and -S/--smart-case.

    -v, --invert-match
        This flag inverts matching. That is, instead of printing lines that
        match, ripgrep will print lines that don't match.

        Note that this only inverts line-by-line matching. For example,
        combining this flag with -l/--files-with-matches will emit files that
        contain any lines that do not match the patterns given. That's not the
        same as, for example, --files-without-match, which will emit files that
        do not contain any matching lines.

        This flag can be disabled with --no-invert-match.

    -x, --line-regexp
        When enabled, ripgrep will only show matches surrounded by line
        boundaries. This is equivalent to surrounding every pattern with ^ and
        $. In other words, this only prints lines where the entire line
        participates in a match.

        This overrides the -w/--word-regexp flag.

    -m NUM, --max-count=NUM
        Limit the number of matching lines per file searched to NUM.

        Note that 0 is a legal value but not likely to be useful. When used,
        ripgrep won't search anything.

    --mmap
        When enabled, ripgrep will search using memory maps when possible. This
        is enabled by default when ripgrep thinks it will be faster.

        Memory map searching cannot be used in all circumstances. For example,
        when searching virtual files or streams likes stdin. In such cases,
        memory maps will not be used even when this flag is enabled.

        Note that ripgrep may abort unexpectedly when memory maps are used if
        it searches a file that is simultaneously truncated. Users can opt out
        of this possibility by disabling memory maps.

        This flag can be disabled with --no-mmap.

    -U, --multiline
        This flag enable searching across multiple lines.

        When multiline mode is enabled, ripgrep will lift the restriction that
        a match cannot include a line terminator. For example, when multiline
        mode is not enabled (the default), then the regex \p{any} will match
        any Unicode codepoint other than \n. Similarly, the regex \n is
        explicitly forbidden, and if you try to use it, ripgrep will return an
        error. However, when multiline mode is enabled, \p{any} will match any
        Unicode codepoint, including \n, and regexes like \n are permitted.

        An important caveat is that multiline mode does not change the match
        semantics of .. Namely, in most regex matchers, a . will by default
        match any character other than \n, and this is true in ripgrep as well.
        In order to make . match \n, you must enable the "dot all" flag inside
        the regex. For example, both (?s). and (?s:.) have the same semantics,
        where . will match any character, including \n. Alternatively, the
        --multiline-dotall flag may be passed to make the "dot all" behavior
        the default. This flag only applies when multiline search is enabled.

        There is no limit on the number of the lines that a single match can
        span.

        WARNING: Because of how the underlying regex engine works, multiline
        searches may be slower than normal line-oriented searches, and they may
        also use more memory. In particular, when multiline mode is enabled,
        ripgrep requires that each file it searches is laid out contiguously in
        memory (either by reading it onto the heap or by memory-mapping it).
        Things that cannot be memory-mapped (such as stdin) will be consumed
        until EOF before searching can begin. In general, ripgrep will only do
        these things when necessary. Specifically, if the -U/--multiline flag
        is provided but the regex does not contain patterns that would match \n
        characters, then ripgrep will automatically avoid reading each file
        into memory before searching it. Nevertheless, if you only care about
        matches spanning at most one line, then it is always better to disable
        multiline mode.

        This overrides the --stop-on-nonmatch flag.

        This flag can be disabled with --no-multiline.

    --multiline-dotall
        This flag enables "dot all" mode in all regex patterns. This causes .
        to match line terminators when multiline searching is enabled. This
        flag has no effect if multiline searching isn't enabled with the
        -U/--multiline flag.

        Normally, a . will match any character except line terminators. While
        this behavior typically isn't relevant for line-oriented matching
        (since matches can span at most one line), this can be useful when
        searching with the -U/--multiline flag. By default, multiline mode runs
        without "dot all" mode enabled.

        This flag is generally intended to be used in an alias or your ripgrep
        config file if you prefer "dot all" semantics by default. Note that
        regardless of whether this flag is used, "dot all" semantics can still
        be controlled via inline flags in the regex pattern itself, e.g.,
        (?s:.) always enables "dot all" whereas (?-s:.) always disables "dot
        all". Moreover, you can use character classes like \p{any} to match any
        Unicode codepoint regardless of whether "dot all" mode is enabled or
        not.

        This flag can be disabled with --no-multiline-dotall.

    --no-unicode
        This flag disables Unicode mode for all patterns given to ripgrep.

        By default, ripgrep will enable "Unicode mode" in all of its regexes.
        This has a number of consequences:

        • . will only match valid UTF-8 encoded Unicode scalar values.

        • Classes like \w, \s, \d are all Unicode aware and much bigger than
        their ASCII only versions.

        • Case insensitive matching will use Unicode case folding.

        • A large array of classes like \p{Emoji} are available. (Although the
        specific set of classes available varies based on the regex engine. In
        general, the default regex engine has more classes available to it.)

        • Word boundaries (\b and \B) use the Unicode definition of a word
        character.

        In some cases it can be desirable to turn these things off. This flag
        will do exactly that. For example, Unicode mode can sometimes have a
        negative impact on performance, especially when things like \w are used
        frequently (including via bounded repetitions like \w{100}) when only
        their ASCII interpretation is needed.

        This flag can be disabled with --unicode.

    --null-data
        Enabling this flag causes ripgrep to use NUL as a line terminator
        instead of the default of \n.

        This is useful when searching large binary files that would otherwise
        have very long lines if \n were used as the line terminator. In
        particular, ripgrep requires that, at a minimum, each line must fit
        into memory. Using NUL instead can be a useful stopgap to keep memory
        requirements low and avoid OOM (out of memory) conditions.

        This is also useful for processing NUL delimited data, such as that
        emitted when using ripgrep's -0/--null flag or find's --print0 flag.

        Using this flag implies -a/--text. It also overrides --crlf.

    -P, --pcre2
        When this flag is present, ripgrep will use the PCRE2 regex engine
        instead of its default regex engine.

        This is generally useful when you want to use features such as
        look-around or backreferences.

        Using this flag is the same as passing --engine=pcre2. Users may
        instead elect to use --engine=auto to ask ripgrep to automatically
        select the right regex engine based on the patterns given. This flag
        and the --engine flag override one another.

        Note that PCRE2 is an optional ripgrep feature. If PCRE2 wasn't
        included in your build of ripgrep, then using this flag will result in
        ripgrep printing an error message and exiting. PCRE2 may also have
        worse user experience in some cases, since it has fewer introspection
        APIs than ripgrep's default regex engine. For example, if you use a \n
        in a PCRE2 regex without the -U/--multiline flag, then ripgrep will
        silently fail to match anything instead of reporting an error
        immediately (like it does with the default regex engine).

        This flag can be disabled with --no-pcre2.

    --regex-size-limit=NUM+SUFFIX?
        The size limit of the compiled regex, where the compiled regex
        generally corresponds to a single object in memory that can match all
        of the patterns provided to ripgrep. The default limit is generous
        enough that most reasonable patterns (or even a small number of them)
        should fit.

        This useful to change when you explicitly want to let ripgrep spend
        potentially much more time and/or memory building a regex matcher.

        The input format accepts suffixes of K, M or G which correspond to
        kilobytes, megabytes and gigabytes, respectively. If no suffix is
        provided the input is treated as bytes.

    -S, --smart-case
        This flag instructs ripgrep to searches case insensitively if the
        pattern is all lowercase. Otherwise, ripgrep will search case
        sensitively.

        A pattern is considered all lowercase if both of the following rules
        hold:

        • First, the pattern contains at least one literal character. For
        example, a\w contains a literal (a) but just \w does not.

        • Second, of the literals in the pattern, none of them are considered
        to be uppercase according to Unicode. For example, foo\pL has no
        uppercase literals but Foo\pL does.

        This overrides the -s/--case-sensitive and -i/--ignore-case flags.

    --stop-on-nonmatch
        Enabling this option will cause ripgrep to stop reading a file once it
        encounters a non-matching line after it has encountered a matching
        line. This is useful if it is expected that all matches in a given file
        will be on sequential lines, for example due to the lines being sorted.

        This overrides the -U/--multiline flag.

    -a, --text
        This flag instructs ripgrep to search binary files as if they were
        text. When this flag is present, ripgrep's binary file detection is
        disabled. This means that when a binary file is searched, its contents
        may be printed if there is a match. This may cause escape codes to be
        printed that alter the behavior of your terminal.

        When binary file detection is enabled, it is imperfect. In general, it
        uses a simple heuristic. If a NUL byte is seen during search, then the
        file is considered binary and searching stops (unless this flag is
        present). Alternatively, if the --binary flag is used, then ripgrep
        will only quit when it sees a NUL byte after it sees a match (or
        searches the entire file).

        This flag overrides the --binary flag.

        This flag can be disabled with --no-text.

    -j NUM, --threads=NUM
        This flag sets the approximate number of threads to use. A value of 0
        (which is the default) causes ripgrep to choose the thread count using
        heuristics.

    -w, --word-regexp
        When enabled, ripgrep will only show matches surrounded by word
        boundaries. This is equivalent to surrounding every pattern with
        \b{start-half} and \b{end-half}.

        This overrides the -x/--line-regexp flag.

    --auto-hybrid-regex
        DEPRECATED. Use --engine instead.

        When this flag is used, ripgrep will dynamically choose between
        supported regex engines depending on the features used in a pattern.
        When ripgrep chooses a regex engine, it applies that choice for every
        regex provided to ripgrep (e.g., via multiple -e/--regexp or -f/--file
        flags).

        As an example of how this flag might behave, ripgrep will attempt to
        use its default finite automata based regex engine whenever the pattern
        can be successfully compiled with that regex engine. If PCRE2 is
        enabled and if the pattern given could not be compiled with the default
        regex engine, then PCRE2 will be automatically used for searching. If
        PCRE2 isn't available, then this flag has no effect because there is
        only one regex engine to choose from.

        In the future, ripgrep may adjust its heuristics for how it decides
        which regex engine to use. In general, the heuristics will be limited
        to a static analysis of the patterns, and not to any specific runtime
        behavior observed while searching files.

        The primary downside of using this flag is that it may not always be
        obvious which regex engine ripgrep uses, and thus, the match semantics
        or performance profile of ripgrep may subtly and unexpectedly change.
        However, in many cases, all regex engines will agree on what
        constitutes a match and it can be nice to transparently support more
        advanced regex features like look-around and backreferences without
        explicitly needing to enable them.

        This flag can be disabled with --no-auto-hybrid-regex.

    --no-pcre2-unicode
        DEPRECATED. Use --no-unicode instead.

        Note that Unicode mode is enabled by default.

        This flag can be disabled with --pcre2-unicode.

# FILTER OPTIONS:

    --binary
        Enabling this flag will cause ripgrep to search binary files. By
        default, ripgrep attempts to automatically skip binary files in order
        to improve the relevance of results and make the search faster.

        Binary files are heuristically detected based on whether they contain a
        NUL byte or not. By default (without this flag set), once a NUL: byte
        is seen, ripgrep will stop searching the file. Usually, NUL bytes occur
        in the beginning of most binary files. If a NUL byte occurs after a
        match, then ripgrep will not print the match, stop searching that file,
        and emit a warning that some matches are being suppressed.

        In contrast, when this flag is provided, ripgrep will continue
        searching a file even if a NUL byte is found. In particular, if a NUL
        byte is found then ripgrep will continue searching until either a match
        is found or the end of the file is reached, whichever comes sooner. If
        a match is found, then ripgrep will stop and print a warning saying
        that the search stopped prematurely.

        If you want ripgrep to search a file without any special NUL byte
        handling at all (and potentially print binary data to stdout), then you
        should use the -a/--text flag.

        The --binary flag is a flag for controlling ripgrep's automatic
        filtering mechanism. As such, it does not need to be used when
        searching a file explicitly or when searching stdin. That is, it is
        only applicable when recursively searching a directory.

        When the -u/--unrestricted flag is provided for a third time, then this
        flag is automatically enabled.

        This flag overrides the -a/--text flag.

        This flag can be disabled with --no-binary.

    -L, --follow
        This flag instructs ripgrep to follow symbolic links while traversing
        directories. This behavior is disabled by default. Note that ripgrep
        will check for symbolic link loops and report errors if it finds one.
        ripgrep will also report errors for broken links. To suppress error
        messages, use the --no-messages flag.

        This flag can be disabled with --no-follow.

    -g GLOB, --glob=GLOB
        Include or exclude files and directories for searching that match the
        given glob. This always overrides any other ignore logic. Multiple glob
        flags may be used. Globbing rules match .gitignore globs. Precede a
        glob with a ! to exclude it. If multiple globs match a file or
        directory, the glob given later in the command line takes precedence.

        As an extension, globs support specifying alternatives: "-g'"ab{c,d}*'
        is equivalent to "-g""abc""-g"abd. Empty alternatives like "-g'"ab{,c}'
        are not currently supported. Note that this syntax extension is also
        currently enabled in gitignore files, even though this syntax isn't
        supported by git itself. ripgrep may disable this syntax extension in
        gitignore files, but it will always remain available via the -g/--glob
        flag.

        When this flag is set, every file and directory is applied to it to
        test for a match. For example, if you only want to search in a
        particular directory foo, then "-g"foo is incorrect because foo/bar
        does not match the glob foo. Instead, you should use "-g'"foo/**'.

    --glob-case-insensitive
        Process all glob patterns given with the -g/--glob flag case
        insensitively. This effectively treats -g/--glob as --iglob.

        This flag can be disabled with --no-glob-case-insensitive.

    -., --hidden
        Search hidden files and directories. By default, hidden files and
        directories are skipped. Note that if a hidden file or a directory is
        whitelisted in an ignore file, then it will be searched even if this
        flag isn't provided. Similarly if a hidden file or directory is given
        explicitly as an argumnet to ripgrep.

        A file or directory is considered hidden if its base name starts with a
        dot character (.). On operating systems which support a "hidden" file
        attribute, like Windows, files with this attribute are also considered
        hidden.

        This flag can be disabled with --no-hidden.

    --iglob=GLOB
        Include or exclude files and directories for searching that match the
        given glob. This always overrides any other ignore logic. Multiple glob
        flags may be used. Globbing rules match .gitignore globs. Precede a
        glob with a ! to exclude it. If multiple globs match a file or
        directory, the glob given later in the command line takes precedence.
        Globs used via this flag are matched case insensitively.

    --ignore-file=PATH
        Specifies a path to one or more gitignore formatted rules files. These
        patterns are applied after the patterns found in .gitignore, .rgignore
        and .ignore are applied and are matched relative to the current working
        directory. Multiple additional ignore files can be specified by using
        this flag repeatedly. When specifying multiple ignore files, earlier
        files have lower precedence than later files.

        If you are looking for a way to include or exclude files and
        directories directly on the command line, then use -g/--glob instead.

    --ignore-file-case-insensitive
        Process ignore files (.gitignore, .ignore, etc.) case insensitively.
        Note that this comes with a performance penalty and is most useful on
        case insensitive file systems (such as Windows).

        This flag can be disabled with --no-ignore-file-case-insensitive.

    -d NUM, --max-depth=NUM
        This flag limits the depth of directory traversal to NUM levels beyond
        the paths given. A value of 0 only searches the explicitly given paths
        themselves.

        For example, rg --max-depth 0 dir/ is a no-op because dir/ will not be
        descended into. rg --max-depth 1 dir/ will search only the direct
        children of dir.

        An alternative spelling for this flag is --maxdepth.

    --max-filesize=NUM+SUFFIX?
        Ignore files larger than NUM in size. This does not apply to
        directories.

        The input format accepts suffixes of K, M or G which correspond to
        kilobytes, megabytes and gigabytes, respectively. If no suffix is
        provided the input is treated as bytes.

        Examples: --max-filesize 50K or --max-filesize 80M.

    --no-ignore
        When set, ignore files such as .gitignore, .ignore and .rgignore will
        not be respected. This implies --no-ignore-dot, --no-ignore-exclude,
        --no-ignore-global, --no-ignore-parent and --no-ignore-vcs.

        This does not imply --no-ignore-files, since --ignore-file is specified
        explicitly as a command line argument.

        When given only once, the -u/--unrestricted flag is identical in
        behavior to this flag and can be considered an alias. However,
        subsequent -u/--unrestricted flags have additional effects.

        This flag can be disabled with --ignore.

    --no-ignore-dot
        Don't respect filter rules from .ignore or .rgignore files.

        This does not impact whether ripgrep will ignore files and directories
        whose names begin with a dot. For that, see the -./--hidden flag. This
        flag also does not impact whether filter rules from .gitignore files
        are respected.

        This flag can be disabled with --ignore-dot.

    --no-ignore-exclude
        Don't respect filter rules from files that are manually configured for
        the repository. For example, this includes git's .git/info/exclude.

        This flag can be disabled with --ignore-exclude.

    --no-ignore-files
        When set, any --ignore-file flags, even ones that come after this flag,
        are ignored.

        This flag can be disabled with --ignore-files.

    --no-ignore-global
        Don't respect filter rules from ignore files that come from "global"
        sources such as git's core.excludesFile configuration option (which
        defaults to $HOME/.config/git/ignore).

        This flag can be disabled with --ignore-global.

    --no-ignore-parent
        When this flag is set, filter rules from ignore files found in parent
        directories are not respected. By default, ripgrep will ascend the
        parent directories of the current working directory to look for any
        applicable ignore files that should be applied. In some cases this may
        not be desirable.

        This flag can be disabled with --ignore-parent.

    --no-ignore-vcs
        When given, filter rules from source control ignore files (e.g.,
        .gitignore) are not respected. By default, ripgrep respects git's
        ignore rules for automatic filtering. In some cases, it may not be
        desirable to respect the source control's ignore rules and instead only
        respect rules in .ignore or .rgignore.

        This flag implies --no-ignore-parent for source control ignore files as
        well.

        This flag can be disabled with --ignore-vcs.

    --no-require-git
        When this flag is given, source control ignore files such as .gitignore
        are respected even if no git repository is present.

        By default, ripgrep will only respect filter rules from source control
        ignore files when ripgrep detects that the search is executed inside a
        source control repository. For example, when a .git directory is
        observed.

        This flag relaxes the default restriction. For example, it might be
        useful when the contents of a git repository are stored or copied
        somewhere, but where the repository state is absent.

        This flag can be disabled with --require-git.

    --one-file-system
        When enabled, ripgrep will not cross file system boundaries relative to
        where the search started from.

        Note that this applies to each path argument given to ripgrep. For
        example, in the command

            rg --one-file-system /foo/bar /quux/baz

        ripgrep will search both /foo/bar and /quux/baz even if they are on
        different file systems, but will not cross a file system boundary when
        traversing each path's directory tree.

        This is similar to find's -xdev or -mount flag.

        This flag can be disabled with --no-one-file-system.

    -t TYPE, --type=TYPE
        This flag limits ripgrep to searching files matching TYPE. Multiple
        -t/--type flags may be provided.

        This flag supports the special value all, which will behave as if
        -t/--type was provided for every file type supported by ripgrep
        (including any custom file types). The end result is that --type=all
        causes ripgrep to search in "whitelist" mode, where it will only search
        files it recognizes via its type definitions.

        Note that this flag has lower precedence than both the -g/--glob flag
        and any rules found in ignore files.

        To see the list of available file types, use the --type-list flag.

    -T TYPE, --type-not=TYPE
        Do not search files matching TYPE. Multiple -T/--type-not flags may be
        provided. Use the --type-list flag to list all available types.

        This flag supports the special value all, which will behave as if
        -T/--type-not was provided for every file type supported by ripgrep
        (including any custom file types). The end result is that
        --type-not=all causes ripgrep to search in "blacklist" mode, where it
        will only search files that are unrecognized by its type definitions.

        To see the list of available file types, use the --type-list flag.

    --type-add=TYPESPEC
        This flag adds a new glob for a particular file type. Only one glob can
        be added at a time. Multiple --type-add flags can be provided. Unless
        --type-clear is used, globs are added to any existing globs defined
        inside of ripgrep.

        Note that this must be passed to every invocation of ripgrep. Type
        settings are not persisted. See CONFIGURATION FILES for a workaround.

        Example:

            rg --type-add 'foo:*.foo' -tfoo PATTERN

        This flag can also be used to include rules from other types with the
        special include directive. The include directive permits specifying one
        or more other type names (separated by a comma) that have been defined
        and its rules will automatically be imported into the type specified.
        For example, to create a type called src that matches C++, Python and
        Markdown files, one can use:

            --type-add 'src:include:cpp,py,md'

        Additional glob rules can still be added to the src type by using this
        flag again:

            --type-add 'src:include:cpp,py,md' --type-add 'src:*.foo'

        Note that type names must consist only of Unicode letters or numbers.
        Punctuation characters are not allowed.

    --type-clear=TYPE
        Clear the file type globs previously defined for TYPE. This clears any
        previously defined globs for the TYPE, but globs can be added after
        this flag.

        Note that this must be passed to every invocation of ripgrep. Type
        settings are not persisted. See CONFIGURATION FILES for a workaround.

    -u, --unrestricted
        This flag reduces the level of "smart" filtering. Repeated uses (up to
        3) reduces the filtering even more. When repeated three times, ripgrep
        will search every file in a directory tree.

        A single -u/--unrestricted flag is equivalent to --no-ignore. Two
        -u/--unrestricted flags is equivalent to --no-ignore -./--hidden. Three
        -u/--unrestricted flags is equivalent to --no-ignore -./--hidden
        --binary.

        The only filtering ripgrep still does when -uuu is given is to skip
        symbolic links and to avoid printing matches from binary files.
        Symbolic links can be followed via the -L/--follow flag, and binary
        files can be treated as text files via the -a/--text flag.

# OUTPUT OPTIONS:

    -A NUM, --after-context=NUM
        Show NUM lines after each match.

        This overrides the --passthru flag and partially overrides the
        -C/--context flag.

    -B NUM, --before-context=NUM
        Show NUM lines before each match.

        This overrides the --passthru flag and partially overrides the
        -C/--context flag.

    --block-buffered
        When enabled, ripgrep will use block buffering. That is, whenever a
        matching line is found, it will be written to an in-memory buffer and
        will not be written to stdout until the buffer reaches a certain size.
        This is the default when ripgrep's stdout is redirected to a pipeline
        or a file. When ripgrep's stdout is connected to a tty, line buffering
        will be used by default. Forcing block buffering can be useful when
        dumping a large amount of contents to a tty.

        This overrides the --line-buffered flag.

        This flag can be disabled with --no-block-buffered.

    -b, --byte-offset
        Print the 0-based byte offset within the input file before each line of
        output. If -o/--only-matching is specified, print the offset of the
        matched text itself.

        If ripgrep does transcoding, then the byte offset is in terms of the
        result of transcoding and not the original data. This applies similarly
        to other transformations on the data, such as decompression or a --pre
        filter.

        This flag can be disabled with --no-byte-offset.

    --color=WHEN
        This flag controls when to use colors. The default setting is auto,
        which means ripgrep will try to guess when to use colors. For example,
        if ripgrep is printing to a tty, then it will use colors, but if it is
        redirected to a file or a pipe, then it will suppress color output.

        ripgrep will suppress color output by default in some other
        circumstances as well. These include, but are not limited to:

        • When the TERM environment variable is not set or set to dumb.

        • When the NO_COLOR environment variable is set (regardless of value).

        • When flags that imply no use for colors are given. For example,
        --vimgrep and --json.

        The possible values for this flag are:

        never: Colors will never be used.

        auto: The default. ripgrep tries to be smart.

        always: Colors will always be used regardless of where output is sent.

        ansi: Like 'always', but emits ANSI escapes (even in a Windows
        console).

        This flag also controls whether hyperlinks are emitted. For example,
        when a hyperlink format is specified, hyperlinks won't be used when
        color is suppressed. If one wants to emit hyperlinks but no colors,
        then one must use the --colors flag to manually set all color styles to
        none:

            --colors 'path:none' \
            --colors 'line:none' \
            --colors 'column:none' \
            --colors 'match:none'

    --colors=COLOR_SPEC
        This flag specifies color settings for use in the output. This flag may
        be provided multiple times. Settings are applied iteratively.
        Pre-existing color labels are limited to one of eight choices: red,
        blue, green, cyan, magenta, yellow, white and black. Styles are limited
        to nobold, bold, nointense, intense, nounderline or underline.

        The format of the flag is {type}:{attribute}:{value}. type should be
        one of path, line, column or match. attribute can be fg, bg or style.
        value is either a color (for fg and bg) or a text style. A special
        format, {type}:none, will clear all color settings for type.

        For example, the following command will change the match color to
        magenta and the background color for line numbers to yellow:

            rg --colors 'match:fg:magenta' --colors 'line:bg:yellow'

        Extended colors can be used for value when the tty supports ANSI color
        sequences. These are specified as either x (256-color) or x,x,x (24-bit
        truecolor) where x is a number between 0 and 255 inclusive. x may be
        given as a normal decimal number or a hexadecimal number, which is
        prefixed by 0x.

        For example, the following command will change the match background
        color to that represented by the rgb value (0,128,255):

            rg --colors 'match:bg:0,128,255'

        or, equivalently,

            rg --colors 'match:bg:0x0,0x80,0xFF'

        Note that the intense and nointense styles will have no effect when
        used alongside these extended color codes.

    --column
        Show column numbers (1-based). This only shows the column numbers for
        the first match on each line. This does not try to account for Unicode.
        One byte is equal to one column. This implies -n/--line-number.

        When -o/--only-matching is used, then the column numbers written
        correspond to the start of each match.

        This flag can be disabled with --no-column.

    -C NUM, --context=NUM
        Show NUM lines before and after each match. This is equivalent to
        providing both the -B/--before-context and -A/--after-context flags
        with the same value.

        This overrides the --passthru flag. The -A/--after-context and
        -B/--before-context flags both partially override this flag, regardless
        of the order. For example, -A2 -C1 is equivalent to -A2 -B1.

    --context-separator=SEPARATOR
        The string used to separate non-contiguous context lines in the output.
        This is only used when one of the context flags is used (that is,
        -A/--after-context, -B/--before-context or -C/--context). Escape
        sequences like \x7F or \t may be used. The default value is --.

        When the context separator is set to an empty string, then a line break
        is still inserted. To completely disable context separators, use the
        --no-context-separator flag.

    --field-context-separator=SEPARATOR
        Set the field context separator. This separator is only used when
        printing contextual lines. It is used to delimit file paths, line
        numbers, columns and the contextual line itself. The separator may be
        any number of bytes, including zero. Escape sequences like \x7F or \t
        may be used.

        The - character is the default value.

    --field-match-separator=SEPARATOR
        Set the field match separator. This separator is only used when
        printing matching lines. It is used to delimit file paths, line
        numbers, columns and the matching line itself. The separator may be any
        number of bytes, including zero. Escape sequences like \x7F or \t may
        be used.

        The : character is the default value.

    --heading
        This flag prints the file path above clusters of matches from each file
        instead of printing the file path as a prefix for each matched line.

        This is the default mode when printing to a tty.

        When stdout is not a tty, then ripgrep will default to the standard
        grep-like format. Once can force this format in Unix-like environments
        by piping the output of ripgrep to cat. For example, rg foo | cat.

        This flag can be disabled with --no-heading.

    -h, --help
        This flag prints the help output for ripgrep.

        Unlike most other flags, the behavior of the short flag, -h, and the
        long flag, --help, is different. The short flag will show a condensed
        help output while the long flag will show a verbose help output. The
        verbose help output has complete documentation, where as the condensed
        help output will show only a single line for every flag.

    --hostname-bin=COMMAND
        This flag controls how ripgrep determines this system's hostname. The
        flag's value should correspond to an executable (either a path or
        something that can be found via your system's PATH environment
        variable). When set, ripgrep will run this executable, with no
        arguments, and treat its output (with leading and trailing whitespace
        stripped) as your system's hostname.

        When not set (the default, or the empty string), ripgrep will try to
        automatically detect your system's hostname. On Unix, this corresponds
        to calling gethostname. On Windows, this corresponds to calling
        GetComputerNameExW to fetch the system's "physical DNS hostname."

        ripgrep uses your system's hostname for producing hyperlinks.

    --hyperlink-format=FORMAT
        Set the format of hyperlinks to use when printing results. Hyperlinks
        make certain elements of ripgrep's output, such as file paths,
        clickable. This generally only works in terminal emulators that support
        OSC-8 hyperlinks. For example, the format file://{host}{path} will emit
        an RFC 8089 hyperlink. To see the format that ripgrep is using, pass
        the --debug flag.

        Alternatively, a format string may correspond to one of the following
        aliases: default, none, file, grep+, kitty, macvim, textmate, vscode,
        vscode-insiders, vscodium. The alias will be replaced with a format
        string that is intended to work for the corresponding application.

        The following variables are available in the format string:

        {path}: Required. This is replaced with a path to a matching file. The
        path is guaranteed to be absolute and percent encoded such that it is
        valid to put into a URI. Note that a path is guaranteed to start with a
        /.

        {host}: Optional. This is replaced with your system's hostname. On
        Unix, this corresponds to calling gethostname. On Windows, this
        corresponds to calling GetComputerNameExW to fetch the system's
        "physical DNS hostname." Alternatively, if --hostname-bin was provided,
        then the hostname returned from the output of that program will be
        returned. If no hostname could be found, then this variable is replaced
        with the empty string.

        {line}: Optional. If appropriate, this is replaced with the line number
        of a match. If no line number is available (for example, if
        --no-line-number was given), then it is automatically replaced with the
        value 1.

        {column}: Optional, but requires the presence of {line}. If
        appropriate, this is replaced with the column number of a match. If no
        column number is available (for example, if --no-column was given),
        then it is automatically replaced with the value 1.

        {wslprefix}: Optional. This is a special value that is set to
        wsl$/WSL_DISTRO_NAME, where WSL_DISTRO_NAME corresponds to the value of
        the equivalent environment variable. If the system is not Unix or if
        the WSL_DISTRO_NAME environment variable is not set, then this is
        replaced with the empty string.

        A format string may be empty. An empty format string is equivalent to
        the none alias. In this case, hyperlinks will be disabled.

        At present, ripgrep does not enable hyperlinks by default. Users must
        opt into them. If you aren't sure what format to use, try default.

        Like colors, when ripgrep detects that stdout is not connected to a
        tty, then hyperlinks are automatically disabled, regardless of the
        value of this flag. Users can pass --color=always to forcefully emit
        hyperlinks.

        Note that hyperlinks are only written when a path is also in the output
        and colors are enabled. To write hyperlinks without colors, you'll need
        to configure ripgrep to not colorize anything without actually
        disabling all ANSI escape codes completely:

            --colors 'path:none' \
            --colors 'line:none' \
            --colors 'column:none' \
            --colors 'match:none'

        ripgrep works this way because it treats the --color flag as a proxy
        for whether ANSI escape codes should be used at all. This means that
        environment variables like NO_COLOR=1 and TERM=dumb not only disable
        colors, but hyperlinks as well. Similarly, colors and hyperlinks are
        disabled when ripgrep is not writing to a tty. (Unless one forces the
        issue by setting --color=always.)

        If you're searching a file directly, for example:

            rg foo path/to/file

        then hyperlinks will not be emitted since the path given does not
        appear in the output. To make the path appear, and thus also a
        hyperlink, use the -H/--with-filename flag.

        For more information on hyperlinks in terminal emulators, see:
        https://gist.github.com/egmontkob/eb114294efbcd5adb1944c9f3cb5feda

    --include-zero
        When used with -c/--count or --count-matches, this causes ripgrep to
        print the number of matches for each file even if there were zero
        matches. This is disabled by default but can be enabled to make ripgrep
        behave more like grep.

        This flag can be disabled with --no-include-zero.

    --line-buffered
        When enabled, ripgrep will always use line buffering. That is, whenever
        a matching line is found, it will be flushed to stdout immediately.
        This is the default when ripgrep's stdout is connected to a tty, but
        otherwise, ripgrep will use block buffering, which is typically faster.
        This flag forces ripgrep to use line buffering even if it would
        otherwise use block buffering. This is typically useful in shell
        pipelines, for example:

            tail -f something.log | rg foo --line-buffered | rg bar

        This overrides the --block-buffered flag.

        This flag can be disabled with --no-line-buffered.

    -n, --line-number
        Show line numbers (1-based).

        This is enabled by default when stdout is connected to a tty.

        This flag can be disabled by -N/--no-line-number.

    -N, --no-line-number
        Suppress line numbers.

        Line numbers are off by default when stdout is not connected to a tty.

        Line numbers can be forcefully turned on by -n/--line-number.

    -M NUM, --max-columns=NUM
        When given, ripgrep will omit lines longer than this limit in bytes.
        Instead of printing long lines, only the number of matches in that line
        is printed.

        When this flag is omitted or is set to 0, then it has no effect.

    --max-columns-preview
        Prints a preview for lines exceeding the configured max column limit.

        When the -M/--max-columns flag is used, ripgrep will by default
        completely replace any line that is too long with a message indicating
        that a matching line was removed. When this flag is combined with
        -M/--max-columns, a preview of the line (corresponding to the limit
        size) is shown instead, where the part of the line exceeding the limit
        is not shown.

        If the -M/--max-columns flag is not set, then this has no effect.

        This flag can be disabled with --no-max-columns-preview.

    -0, --null
        Whenever a file path is printed, follow it with a NUL byte. This
        includes printing file paths before matches, and when printing a list
        of matching files such as with -c/--count, -l/--files-with-matches and
        --files. This option is useful for use with xargs.

    -o, --only-matching
        Print only the matched (non-empty) parts of a matching line, with each
        such part on a separate output line.

    --path-separator=SEPARATOR
        Set the path separator to use when printing file paths. This defaults
        to your platform's path separator, which is / on Unix and \ on Windows.
        This flag is intended for overriding the default when the environment
        demands it (e.g., cygwin). A path separator is limited to a single
        byte.

        Setting this flag to an empty string reverts it to its default
        behavior. That is, the path separator is automatically chosen based on
        the environment.

    --passthru
        Print both matching and non-matching lines.

        Another way to achieve a similar effect is by modifying your pattern to
        match the empty string. For example, if you are searching using rg foo,
        then using rg '^|foo' instead will emit every line in every file
        searched, but only occurrences of foo will be highlighted. This flag
        enables the same behavior without needing to modify the pattern.

        An alternative spelling for this flag is --passthrough.

        This overrides the -C/--context, -A/--after-context and
        -B/--before-context flags.

    -p, --pretty
        This is a convenience alias for --color=always --heading --line-number.
        This flag is useful when you still want pretty output even if you're
        piping ripgrep to another program or file. For example: rg -p foo |
        less -R.

    -q, --quiet
        Do not print anything to stdout. If a match is found in a file, then
        ripgrep will stop searching. This is useful when ripgrep is used only
        for its exit code (which will be an error code if no matches are
        found).

        When --files is used, ripgrep will stop finding files after finding the
        first file that does not match any ignore rules.

    -r REPLACEMENT, --replace=REPLACEMENT
        Replaces every match with the text given when printing results. Neither
        this flag nor any other ripgrep flag will modify your files.

        Capture group indices (e.g., $5) and names (e.g., $foo) are supported
        in the replacement string. Capture group indices are numbered based on
        the position of the opening parenthesis of the group, where the
        leftmost such group is $1. The special $0 group corresponds to the
        entire match.

        The name of a group is formed by taking the longest string of letters,
        numbers and underscores (i.e. [_0-9A-Za-z]) after the $. For example,
        $1a will be replaced with the group named 1a, not the group at index 1.
        If the group's name contains characters that aren't letters, numbers or
        underscores, or you want to immediately follow the group with another
        string, the name should be put inside braces. For example, ${1}a will
        take the content of the group at index 1 and append a to the end of it.

        If an index or name does not refer to a valid capture group, it will be
        replaced with an empty string.

        In shells such as Bash and zsh, you should wrap the pattern in single
        quotes instead of double quotes. Otherwise, capture group indices will
        be replaced by expanded shell variables which will most likely be
        empty.

        To write a literal $, use $$.

        Note that the replacement by default replaces each match, and not the
        entire line. To replace the entire line, you should match the entire
        line.

        This flag can be used with the -o/--only-matching flag.

    --sort=SORTBY
        This flag enables sorting of results in ascending order. The possible
        values for this flag are:

        none: (Default) Do not sort results. Fastest. Can be multi-threaded.

        path: Sort by file path. Always single-threaded. The order is
        determined by sorting files in each directory entry during traversal.
        This means that given the files a/b and a+, the latter will sort after
        the former even though + would normally sort before /.

        modified: Sort by the last modified time on a file. Always
        single-threaded.

        accessed: Sort by the last accessed time on a file. Always
        single-threaded.

        created: Sort by the creation time on a file. Always single-threaded.

        If the chosen (manually or by-default) sorting criteria isn't available
        on your system (for example, creation time is not available on ext4
        file systems), then ripgrep will attempt to detect this, print an error
        and exit without searching.

        To sort results in reverse or descending order, use the --sortr flag.
        Also, this flag overrides --sortr.

        Note that sorting results currently always forces ripgrep to abandon
        parallelism and run in a single thread.

    --sortr=SORTBY
        This flag enables sorting of results in descending order. The possible
        values for this flag are:

        none: (Default) Do not sort results. Fastest. Can be multi-threaded.

        path: Sort by file path. Always single-threaded. The order is
        determined by sorting files in each directory entry during traversal.
        This means that given the files a/b and a+, the latter will sort before
        the former even though + would normally sort after / when doing a
        reverse lexicographic sort.

        modified: Sort by the last modified time on a file. Always
        single-threaded.

        accessed: Sort by the last accessed time on a file. Always
        single-threaded.

        created: Sort by the creation time on a file. Always single-threaded.

        If the chosen (manually or by-default) sorting criteria isn't available
        on your system (for example, creation time is not available on ext4
        file systems), then ripgrep will attempt to detect this, print an error
        and exit without searching.

        To sort results in ascending order, use the --sort flag. Also, this
        flag overrides --sort.

        Note that sorting results currently always forces ripgrep to abandon
        parallelism and run in a single thread.

    --trim
        When set, all ASCII whitespace at the beginning of each line printed
        will be removed.

        This flag can be disabled with --no-trim.

    --vimgrep
        This flag instructs ripgrep to print results with every match on its
        own line, including line numbers and column numbers.

        With this option, a line with more than one match will be printed in
        its entirety more than once. For that reason, the total amount of
        output as a result of this flag can be quadratic in the size of the
        input. For example, if the pattern matches every byte in an input file,
        then each line will be repeated for every byte matched. For this
        reason, users should only use this flag when there is no other choice.
        Editor integrations should prefer some other way of reading results
        from ripgrep, such as via the --json flag. One alternative to avoiding
        exorbitant memory usage is to force ripgrep into single threaded mode
        with the -j/--threads flag. Note though that this will not impact the
        total size of the output, just the heap memory that ripgrep will use.

    -H, --with-filename
        This flag instructs ripgrep to print the file path for each matching
        line. This is the default when more than one file is searched. If
        --heading is enabled (the default when printing to a tty), the file
        path will be shown above clusters of matches from each file; otherwise,
        the file name will be shown as a prefix for each matched line.

        This flag overrides -I/--no-filename.

    -I, --no-filename
        This flag instructs ripgrep to never print the file path with each
        matching line. This is the default when ripgrep is explicitly
        instructed to search one file or stdin.

        This flag overrides -H/--with-filename.

    --sort-files
        DEPRECATED. Use --sort=path instead.

        This flag instructs ripgrep to sort search results by file path
        lexicographically in ascending order. Note that this currently disables
        all parallelism and runs search in a single thread.

        This flag overrides --sort and --sortr.

        This flag can be disabled with --no-sort-files.

# OUTPUT MODES:

    -c, --count
        This flag suppresses normal output and shows the number of lines that
        match the given patterns for each file searched. Each file containing a
        match has its path and count printed on each line. Note that unless
        -U/--multiline is enabled, this reports the number of lines that match
        and not the total number of matches. In multiline mode, -c/--count is
        equivalent to --count-matches.

        If only one file is given to ripgrep, then only the count is printed if
        there is a match. The -H/--with-filename flag can be used to force
        printing the file path in this case. If you need a count to be printed
        regardless of whether there is a match, then use --include-zero.

        This overrides the --count-matches flag. Note that when -c/--count is
        combined with -o/--only-matching, then ripgrep behaves as if
        --count-matches was given.

    --count-matches
        This flag suppresses normal output and shows the number of individual
        matches of the given patterns for each file searched. Each file
        containing matches has its path and match count printed on each line.
        Note that this reports the total number of individual matches and not
        the number of lines that match.

        If only one file is given to ripgrep, then only the count is printed if
        there is a match. The -H/--with-filename flag can be used to force
        printing the file path in this case.

        This overrides the -c/--count flag. Note that when -c/--count is
        combined with -o/--only-matching, then ripgrep behaves as if
        --count-matches was given.

    -l, --files-with-matches
        Print only the paths with at least one match and suppress match
        contents.

        This overrides --files-without-match.

    --files-without-match
        Print the paths that contain zero matches and suppress match contents.

        This overrides -l/--files-with-matches.

    --json
        Enable printing results in a JSON Lines format.

        When this flag is provided, ripgrep will emit a sequence of messages,
        each encoded as a JSON object, where there are five different message
        types:

        begin: A message that indicates a file is being searched and contains
        at least one match.

        end: A message the indicates a file is done being searched. This
        message also include summary statistics about the search for a
        particular file.

        match: A message that indicates a match was found. This includes the
        text and offsets of the match.

        context: A message that indicates a contextual line was found. This
        includes the text of the line, along with any match information if the
        search was inverted.

        summary: The final message emitted by ripgrep that contains summary
        statistics about the search across all files.

        Since file paths or the contents of files are not guaranteed to be
        valid UTF-8 and JSON itself must be representable by a Unicode
        encoding, ripgrep will emit all data elements as objects with one of
        two keys: text or bytes. text is a normal JSON string when the data is
        valid UTF-8 while bytes is the base64 encoded contents of the data.

        The JSON Lines format is only supported for showing search results. It
        cannot be used with other flags that emit other types of output, such
        as --files, -l/--files-with-matches, --files-without-match, -c/--count
        or --count-matches. ripgrep will report an error if any of the
        aforementioned flags are used in concert with --json.

        Other flags that control aspects of the standard output such as
        -o/--only-matching, --heading, -r/--replace, -M/--max-columns, etc.,
        have no effect when --json is set. However, enabling JSON output will
        always implicitly and unconditionally enable --stats.

        A more complete description of the JSON format used can be found here:
        https://docs.rs/grep-printer/*/grep_printer/struct.JSON.html.

        This flag can be disabled with --no-json.

# LOGGING OPTIONS:
    --debug
        Show debug messages. Please use this when filing a bug report.

        The --debug flag is generally useful for figuring out why ripgrep
        skipped searching a particular file. The debug messages should mention
        all files skipped and why they were skipped.

        To get even more debug output, use the --trace flag, which implies
        --debug along with additional trace data.

    --no-ignore-messages
        When this flag is enabled, all error messages related to parsing ignore
        files are suppressed. By default, error messages are printed to stderr.
        In cases where these errors are expected, this flag can be used to
        avoid seeing the noise produced by the messages.

        This flag can be disabled with --ignore-messages.

    --no-messages
        This flag suppresses some error messages. Specifically, messages
        related to the failed opening and reading of files. Error messages
        related to the syntax of the pattern are still shown.

        This flag can be disabled with --messages.

    --stats
        When enabled, ripgrep will print aggregate statistics about the search.
        When this flag is present, ripgrep will print at least the following
        stats to stdout at the end of the search: number of matched lines,
        number of files with matches, number of files searched, and the time
        taken for the entire search to complete.

        This set of aggregate statistics may expand over time.

        This flag is always and implicitly enabled when --json is used.

        Note that this flag has no effect if --files, -l/--files-with-matches
        or --files-without-match is passed.

        This flag can be disabled with --no-stats.

    --trace
        Show trace messages. This shows even more detail than the --debug flag.
        Generally, one should only use this if --debug doesn't emit the
        information you're looking for.

# OTHER BEHAVIORS:
    --files
        Print each file that would be searched without actually performing the
        search. This is useful to determine whether a particular file is being
        searched or not.

        This overrides --type-list.

    --generate=KIND
        This flag instructs ripgrep to generate some special kind of output
        identified by KIND and then quit without searching. KIND can be one of
        the following values:

        man: Generates a manual page for ripgrep in the roff format.

        complete-bash: Generates a completion script for the bash shell.

        complete-zsh: Generates a completion script for the zsh shell.

        complete-fish: Generates a completion script for the fish shell.

        complete-powershell: Generates a completion script for PowerShell.

        The output is written to stdout. The list above may expand over time.

    --no-config
        When set, ripgrep will never read configuration files. When this flag
        is present, ripgrep will not respect the RIPGREP_CONFIG_PATH
        environment variable.

        If ripgrep ever grows a feature to automatically read configuration
        files in pre-defined locations, then this flag will also disable that
        behavior as well.

    --pcre2-version
        When this flag is present, ripgrep will print the version of PCRE2 in
        use, along with other information, and then exit. If PCRE2 is not
        available, then ripgrep will print an error message and exit with an
        error code.

    --type-list
        Show all supported file types and their corresponding globs. This takes
        any --type-add and --type-clear flags given into account. Each type is
        printed on its own line, followed by a : and then a comma-delimited
        list of globs for that type on the same line.

    -V, --version
        This flag prints ripgrep's version. This also may print other relevant
        information, such as the presence of target specific optimizations and
        the git revision that this build of ripgrep was compiled from.

