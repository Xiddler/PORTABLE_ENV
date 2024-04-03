# check pandoc is installed
->% hash pandoc 2>/dev/null || { echo >&2 "Error: pandoc is not installed. Please install it to use this script."; exit 1; }

(if no message, it's installed)

# basic use
; show output file first

$ pandoc -o output.html input.txt

$ pandoc -o filename.html myfile.pdf

# from org file to pdf
❯ pandoc -t pdf -f org -o info1.pdf info.org
 where the source file is info.org
 -t to format
 -f from format
 -o output file

# convert .md files (using template.html) to html files using bash

for file in .md; do pandoc --quiet --template template.html $file -o "docs/${file%.}.html" done

# pandoc help

->% pandoc --help 
pandoc [OPTIONS] [FILES]
  -f FORMAT, -r FORMAT  --from=FORMAT, --read=FORMAT
  -t FORMAT, -w FORMAT  --to=FORMAT, --write=FORMAT
  -o FILE               --output=FILE
                        --data-dir=DIRECTORY
  -M KEY[:VALUE]        --metadata=KEY[:VALUE]
                        --metadata-file=FILE
  -d FILE               --defaults=FILE
                        --file-scope[=true|false]
                        --sandbox[=true|false]
  -s[true|false]        --standalone[=true|false]
                        --template=FILE
  -V KEY[:VALUE]        --variable=KEY[:VALUE]
                        --wrap=auto|none|preserve
                        --ascii[=true|false]
                        --toc[=true|false], --table-of-contents[=true|false]
                        --toc-depth=NUMBER
  -N                    --number-sections
                        --number-offset=NUMBERS
                        --top-level-division=section|chapter|part
                        --extract-media=PATH
                        --resource-path=SEARCHPATH
  -H FILE               --include-in-header=FILE
  -B FILE               --include-before-body=FILE
  -A FILE               --include-after-body=FILE
                        --no-highlight
                        --highlight-style=STYLE|FILE
                        --syntax-definition=FILE
                        --dpi=NUMBER
                        --eol=crlf|lf|native
                        --columns=NUMBER
  -p[true|false]        --preserve-tabs[=true|false]
                        --tab-stop=NUMBER
                        --pdf-engine=PROGRAM
                        --pdf-engine-opt=STRING
                        --reference-doc=FILE
                        --self-contained[=true|false]
                        --embed-resources[=true|false]
                        --request-header=NAME:VALUE
                        --no-check-certificate[=true|false]
                        --abbreviations=FILE
                        --indented-code-classes=STRING
                        --default-image-extension=extension
  -F PROGRAM            --filter=PROGRAM
  -L SCRIPTPATH         --lua-filter=SCRIPTPATH
                        --shift-heading-level-by=NUMBER
                        --base-header-level=NUMBER
                        --track-changes=accept|reject|all
                        --strip-comments[=true|false]
                        --reference-links[=true|false]
                        --reference-location=block|section|document
                        --markdown-headings=setext|atx
                        --list-tables[=true|false]
                        --listings[=true|false]
  -i[true|false]        --incremental[=true|false]
                        --slide-level=NUMBER
                        --section-divs[=true|false]
                        --html-q-tags[=true|false]
                        --email-obfuscation=none|javascript|references
                        --id-prefix=STRING
  -T STRING             --title-prefix=STRING
  -c URL                --css=URL
                        --epub-subdirectory=DIRNAME
                        --epub-cover-image=FILE
                        --epub-title-page[=true|false]
                        --epub-metadata=FILE
                        --epub-embed-font=FILE
                        --split-level=NUMBER
                        --chunk-template=PATHTEMPLATE
                        --epub-chapter-level=NUMBER
                        --ipynb-output=all|none|best
  -C                    --citeproc
                        --bibliography=FILE
                        --csl=FILE
                        --citation-abbreviations=FILE
                        --natbib
                        --biblatex
                        --mathml
                        --webtex[=URL]
                        --mathjax[=URL]
                        --katex[=URL]
                        --gladtex
                        --trace[=true|false]
                        --dump-args[=true|false]
                        --ignore-args[=true|false]
                        --verbose
                        --quiet
                        --fail-if-warnings[=true|false]
                        --log=FILE
                        --bash-completion
                        --list-input-formats
                        --list-output-formats
                        --list-extensions[=FORMAT]
                        --list-highlight-languages
                        --list-highlight-styles
  -D FORMAT             --print-default-template=FORMAT
                        --print-default-data-file=FILE
                        --print-highlight-style=STYLE|FILE
  -v                    --version
  -h                    --help
