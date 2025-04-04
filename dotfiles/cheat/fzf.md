Opened 2024-08-15

fzf is an interactive filter program for any kind of list


# Notes


To preview files in a RHS pane
fzf --preview="cat {}"
or for color scheme
fzf --preview="bat color=always {}"


## Use rg with fzf

example: search for files containing the word 'metavar'

->% rg -d 1 'metavar' | fzf


## Use find to include the pwd
->% find $PWD -print -maxdepth 3 | fzf

# ----------------------------------------

# FULL fzf HELP FILE

# ----------------------------------------

fzf is an interactive filter program for any kind of list.

It implements a "fuzzy" matching algorithm, so you can quickly type in patterns
with omitted characters and still get the results you want.

Project URL: https://github.com/junegunn/fzf
Author: Junegunn Choi <junegunn.c@gmail.com>

Usage: fzf [options]

  Search
    -x, --extended          Extended-search mode
                            (enabled by default; +x or --no-extended to disable)
    -e, --exact             Enable Exact-match
    -i, --ignore-case       Case-insensitive match (default: smart-case match)
    +i, --no-ignore-case    Case-sensitive match
    --scheme=SCHEME         Scoring scheme [default|path|history]
    --literal               Do not normalize latin script letters before matching
    -n, --nth=N[,..]        Comma-separated list of field index expressions
                            for limiting search scope. Each can be a non-zero
                            integer or a range expression ([BEGIN]..[END]).
    --with-nth=N[,..]       Transform the presentation of each line using
                            field index expressions
    -d, --delimiter=STR     Field delimiter regex (default: AWK-style)
    +s, --no-sort           Do not sort the result
    --tail=NUM              Maximum number of items to keep in memory
    --track                 Track the current selection when the result is updated
    --tac                   Reverse the order of the input
    --disabled              Do not perform search
    --tiebreak=CRI[,..]     Comma-separated list of sort criteria to apply
                            when the scores are tied [length|chunk|begin|end|index]
                            (default: length)
  Interface
    -m, --multi[=MAX]       Enable multi-select with tab/shift-tab
    --no-mouse              Disable mouse
    --bind=KEYBINDS         Custom key bindings. Refer to the man page.
    --cycle                 Enable cyclic scroll
    --wrap                  Enable line wrap
    --wrap-sign=STR         Indicator for wrapped lines
    --no-multi-line         Disable multi-line display of items when using --read0
    --keep-right            Keep the right end of the line visible on overflow
    --scroll-off=LINES      Number of screen lines to keep above or below when
                            scrolling to the top or to the bottom (default: 0)
    --no-hscroll            Disable horizontal scroll
    --hscroll-off=COLS      Number of screen columns to keep to the right of the
                            highlighted substring (default: 10)
    --filepath-word         Make word-wise movements respect path separators
    --jump-labels=CHARS     Label characters for jump mode

  Layout
    --height=[~]HEIGHT[%]   Display fzf window below the cursor with the given
                            height instead of using fullscreen.
                            A negative value is calculated as the terminal height
                            minus the given value.
                            If prefixed with '~', fzf will determine the height
                            according to the input size.
    --min-height=HEIGHT     Minimum height when --height is given in percent
                            (default: 10)
    --tmux[=OPTS]           Start fzf in a tmux popup (requires tmux 3.3+)
                            [center|top|bottom|left|right][,SIZE[%]][,SIZE[%]]
                            (default: center,50%)
    --layout=LAYOUT         Choose layout: [default|reverse|reverse-list]
    --border[=STYLE]        Draw border around the finder
                            [rounded|sharp|bold|block|thinblock|double|horizontal|vertical|
                             top|bottom|left|right|none] (default: rounded)
    --border-label=LABEL    Label to print on the border
    --border-label-pos=COL  Position of the border label
                            [POSITIVE_INTEGER: columns from left|
                             NEGATIVE_INTEGER: columns from right][:bottom]
                            (default: 0 or center)
    --margin=MARGIN         Screen margin (TRBL | TB,RL | T,RL,B | T,R,B,L)
    --padding=PADDING       Padding inside border (TRBL | TB,RL | T,RL,B | T,R,B,L)
    --info=STYLE            Finder info style
                            [default|right|hidden|inline[-right][:PREFIX]]
    --info-command=COMMAND  Command to generate info line
    --separator=STR         String to form horizontal separator on info line
    --no-separator          Hide info line separator
    --scrollbar[=C1[C2]]    Scrollbar character(s) (each for main and preview window)
    --no-scrollbar          Hide scrollbar
    --prompt=STR            Input prompt (default: '> ')
    --pointer=STR           Pointer to the current line (default: '▌' or '>')
    --marker=STR            Multi-select marker (default: '┃' or '>')
    --marker-multi-line=STR Multi-select marker for multi-line entries;
                            3 elements for top, middle, and bottom (default: '╻┃╹')
    --header=STR            String to print as header
    --header-lines=N        The first N lines of the input are treated as header
    --header-first          Print header before the prompt line
    --ellipsis=STR          Ellipsis to show when line is truncated (default: '..')

  Display
    --ansi                  Enable processing of ANSI color codes
    --tabstop=SPACES        Number of spaces for a tab character (default: 8)
    --color=COLSPEC         Base scheme (dark|light|16|bw) and/or custom colors
    --highlight-line        Highlight the whole current line
    --no-bold               Do not use bold text

  History
    --history=FILE          History file
    --history-size=N        Maximum number of history entries (default: 1000)

  Preview
    --preview=COMMAND       Command to preview highlighted line ({})
    --preview-window=OPT    Preview window layout (default: right:50%)
                            [up|down|left|right][,SIZE[%]]
                            [,[no]wrap][,[no]cycle][,[no]follow][,[no]hidden]
                            [,border-BORDER_OPT]
                            [,+SCROLL[OFFSETS][/DENOM]][,~HEADER_LINES]
                            [,default][,<SIZE_THRESHOLD(ALTERNATIVE_LAYOUT)]
    --preview-label=LABEL
    --preview-label-pos=N   Same as --border-label and --border-label-pos,
                            but for preview window

  Scripting
    -q, --query=STR         Start the finder with the given query
    -1, --select-1          Automatically select the only match
    -0, --exit-0            Exit immediately when there's no match
    -f, --filter=STR        Filter mode. Do not start interactive finder.
    --print-query           Print query as the first line
    --expect=KEYS           Comma-separated list of keys to complete fzf
    --read0                 Read input delimited by ASCII NUL characters
    --print0                Print output delimited by ASCII NUL characters
    --sync                  Synchronous search for multi-staged filtering
    --with-shell=STR        Shell command and flags to start child processes with
    --listen[=[ADDR:]PORT]  Start HTTP server to receive actions (POST /)
                            (To allow remote process execution, use --listen-unsafe)

  Directory traversal       (Only used when $FZF_DEFAULT_COMMAND is not set)
    --walker=OPTS           [file][,dir][,follow][,hidden] (default: file,follow,hidden)
    --walker-root=DIR       Root directory from which to start walker (default: .)
    --walker-skip=DIRS      Comma-separated list of directory names to skip
                            (default: .git,node_modules)

  Shell integration
    --bash                  Print script to set up Bash shell integration
    --zsh                   Print script to set up Zsh shell integration
    --fish                  Print script to set up Fish shell integration

  Help
    --version               Display version information and exit
    --help                  Show this message
    --man                   Show man page

  Environment variables
    FZF_DEFAULT_COMMAND     Default command to use when input is tty
    FZF_DEFAULT_OPTS        Default options (e.g. '--layout=reverse --info=inline')
    FZF_DEFAULT_OPTS_FILE   Location of the file to read default options from
    FZF_API_KEY             X-API-Key header for HTTP server (--listen)

