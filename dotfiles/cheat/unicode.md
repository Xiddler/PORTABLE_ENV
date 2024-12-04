# frontmatter
filename ~/PORTABLE_ENV/dotfiles/cheat/unicode.md
Links ~/.cheat/vim_digraphs.md; ~/.cheat/vim_special_chars.md

# vim 
Rem: unicode.vim plugin — see below


## In vim to get coding of a character

use ga over a character to see its digraph, hex and octal
or
use g8 over a character to print the hex value of the actual bytes stored in the file (this command assumes UTF-8)

## Examples 

to enter a USV character (Unicode Separated Value)

␟ ◁ insert mode Ctrl V then u241f

℘ ◁ Weirstrass \wp Ctrl V then u2118

¿ ◁ insert mode Ctrl V then u00bf

### Trivially,  the Majuscule U (i.e. uppercase U)
U ◁ insert mode Ctrl V then 85<space>

## Insert Unicode, hex or octal in vim

When you’re in insert mode, you can type <c-v> ie Ctrl V (or <c-q> i.e. Ctrl Q), followed by a letter specifying the format of the number representing the character.

The letters are:

    nothing: decimal 3-digit value, max 255
    o/O: octal 3-digit value, max 377 (same as 255 in decimal)
    x/X: hex 2-digit value, max ff (same as 255 in decimal)
    u: hex 4-digit value, max ffff (same as 65535 in decimal)
    U: hex 8-digit value, max 7fffffff

Example:
LATIN CAPITAL LETTER A WITH GRAVE
(Find any Unicode point eg 'LATIN CAPITAL LETTER A WITH GRAVE' at URL --▷ [Unicode-explorer](https://unicode-explorer.com/search/) )

À ◁-- [insert] c-k A! (A backtick)          Digraph 
À ◁-- [insert] c-q 192                      Dec
À ◁-- [insert] c-q o300                     Octal
À ◁-- [insert] c-q u00c0                    Hex (this is what unicode-explorer supplies)



## to get the Unicode point of a character in vim

## ga over the symbol or letter


## use the unicode.vim plugin

### Usage



Once installed, take a look at the help at :h unicode-plugin



Here is a short overview of the functionality provided by the plugin:

### Selected symbols

With cursor over ℘ the Ex command :UnicodeName outputs the following:-

℘ U+2118 Dec:8472 SCRIPT CAPITAL P (Sm) &weierp; &wp; /\%u2118 "\u2118"

(It's the letter called "the Weierstrass p"; the math. function is called "the Weierstrass p-function")

℘(u)=1/u2+∑ω≠0[1/(u−ω)2−1/ω2]

To insert ℘ into Ex commandline do this:
: Ctrl V u2118
 
 

✓ ◁- is :digraph [Insert mode Ctrl K OK] and is :UnicodeName [Ex mode :UnicodeSearch! U+2713]



ࡆ is not |


### Ex commands:

:Digraphs        - Search for specific digraph char
:UnicodeSearch   - Search for specific Unicode char
:UnicodeSearch!  - Search for specific Unicode char (and add at current cursor position) (Takes the Dec coding it seems!!)
:UnicodeName     - Identify character under cursor (like ga command)
:UnicodeTable    - Print Unicode Table in new window
:DownloadUnicode - Download (or update) Unicode data
:UnicodeCache    - Create cache file


### Insert mode commands:



<C-X><C-G>  - Complete Digraph char (*X<C-x><C-g> inserts ×)

<C-X><C-Z>  - Complete Unicode char (U+00d7<C-x><C-z> inserts ×)



### Normal/Visual mode commands:



<F4>        - Convert selected digraphs into their corresponding characters



### Scripting Functions:



unicode#FindUnicodeBy() - Find Unicode characters

unicode#FindDigraphBy() - Find Digraph char

unicode#Digraph()       - Returns digraph char

unicode#UnicodeName()   - Identifies Unicode character (by value)


