# META
Edited 2022-11-08 made into .md file

Quick access - put the cursor on the term and press * ( an old vim trick )
NON-ASCII
DIGRAPHS
EMOJIS
Arrows

# File management

:e              reload file
:q              quit
:q!             quit without saving changes
:w              write file
:w {file}       write new file
:x              write file and exit

Keybindings
(to match keybindings in doom-emacs)
SPSwSPC         write file
SPSww           write file and exit

Open file under cursor - custom keybinding
,vf # open vert. split
,hf # open hor. split

 Insert filename - relative to starting folder. In INSERT MODE:

<C-r>%

 Insert filepath. In NORMAL MODE:

,d
 Insert filepath. In INSERT MODE:
,n


# Movement

    k
  h   l         basic motion
    j

w               next start of word
W               next start of whitespace-delimited word
e               next end of word
E               next end of whitespace-delimited word
b               previous start of word
B               previous start of whitespace-delimited word
0               start of line
$               end of line
gg              go to first line in file
G               go to end of file
gk		        move down one displayed line
gj		        move up one displayed line

# Insertion

To exit from insert mode use Esc or Ctrl-C
Enter insertion mode and:

a               append after the cursor
A               append at the end of the line
i               insert before the cursor
I               insert at the beginning of the line
o               create a new line under the cursor
O               create a new line above the cursor
R               enter insert mode but replace instead of inserting chars
:r {file}       insert from file i.e. read (file)

# Editing

u               undo
yy              yank (copy) a line
y{motion}       yank text that {motion} moves over
Y               yank from cursor to end of line (personal mapping)
p               paste after cursor
P               paste before cursor
"Del" or x      delete a character
dd              delete a line
d{motion}       delete text that {motion} moves over

# Search and replace with the `:substitute` (aka `:s`) command
## :substitute
:s/foo/bar/	replace the first match of 'foo' with 'bar' on the current line only
:s/foo/bar/g	replace all matches (`g` flag) of 'foo' with 'bar' on the current line only
:%s/foo/bar/g	replace all matches of 'foo' with 'bar' in the entire file (`:%s`)
:%s/foo/bar/gc	ask to manually confirm (`c` flag) each replacement

## :global
:g executes the given command on every line of the file hence global
:g/^$/ d        delete all empty lines in a file
:g/^$/,/./-j    reduce multiple blank lines to a single blank



Preceding a motion or edition with a number repeats it 'n' times
Examples:
50k         moves 50 lines up
2dw         deletes 2 words
5yy         copies 5 lines
42G         go to line 42


# DONAGHS PLUGINS

easymotion
,/
 emmet
! <C-y>,                            # Note the , at the end.
div>p#foo>ul>li*4 <C-y>,

 goyo & limelight
F9
 or
:Goyo

 Check installed plugins
:scriptnames
:help local-additions

 Plugins
 location of info on my vim plugins on zim-wiki
/home/donagh/sd64/zim/Computer/LINUX/1Linux_Live_USB/02a_install_extras/10vim_settings/vim_plugins.txt
eg cd to above folder and ->% grep <surround>

 list plugins
cat /home/donagh/PORTABLE_ENV/vim/plugins/my_vim_plugins
 or
 see /home/donagh/PORTABLE_ENV/vim/vimrc_files/plugins.vim

 To install a new plugin
 1. git clone into /home/donagh/PORTABLE_ENV/vim/dotvim/plugins (which is symlinked to ~/.vim)
 2. vim /home/donagh/PORTABLE_ENV/vim/vimrc_files/plugins.vim " rem: I can use gf to open that file!
 3. add e.g. Plug 'https://github.com/vim-airline/vim-airline-themes.git' under call plug#begin('/home/donagh/.vim/plugins')
 4. run :PlugInstall

 EXAMPLE: install vim-lsp
 A. Clone into the correct folder
1. cd /home/donagh/PORTABLE_ENV/vim/plugins
2. git clone https://github.com/prabirshrestha/vim-lsp
 B. Notify vim of new plugin
3. vim /home/donagh/PORTABLE_ENV/vim/vimrc_files/plugins.vim
4. add Plug 'prabirshrestha/vim-lsp'
 C. Install
5. :PlugInstall

 check installed / working plugins
ll $HOME/PORTABLE_ENV/vim/dotvim/plugins
 or
grep "^Plug" /home/donagh/PORTABLE_ENV/vim/vimrc_files/plugins.vim

 source for plugin recommendations
https://catonmat.net/vim-plugins


vim surround
 to put " around the words bear necessity - with cursor on the b of bear
' ys2w" '
 use ysiw when it's only one word "

to change 'funny' to "funny"
' cs'"'


# Tab navigation
gt # next tab → keybinding L
gT # prev tab → keybinding H

## tab buffers
vim -p file1.text file2.txt # open files in separate tabs
tabe # edit a new file
H   # previous filetab - alias for gt
L   # next filetab - alias for gT
## navigate tabs
tab left H
tab right  L

# Ranges
:12,34s/old/new/g   # substitute in lines 12 to 34 inclusive
12,$                # from line 12 to end of the file
.,$                 # current line to end of file
.,56                # current line to line 56
%                   # all file
1,$                 # equivalent to %


# Open vim at line 23
vim +23 <filename>




# Splits

hor. split      : <Leader> H
ver. split      : <Leader> O
swap splits     : Ctrl W Shift R
equalize split  : Ctrl W =
maximize split  : Ctrl W _ (hor. split)
maximize split  : Ctrl W | (ver. split)
resize split    :res +5 or :vert res -5

# Open a terminal in vim
:sp |:terminal
<leader> tt

## Turn terminal into a vim file
<C-w> <S-n>
 To exit
 <C-w> <S-i>

# Navigation

C-B --> back one pane
C-F --> forward one pane

# Show lines with matching word under cursor

[I


# Non-ascii characters

Help on non-ascii --> :help %u

Insert non-ascii character
eg an M dash —
Insert then Ctrl-V u 2014
The output of ga on that M dash is:


```
    <—> 8212  Hex 2014 Oct 20024 Digr -M

    Search for Mdash
    Mdash —  \%u2014 to replace with [spc]-[spc] do
    :%s/\%u2014/ - /g
```

## DIGRAPHS

:h digraphs
:h digraph-table
:h digraph-table-mbyte

Example euro €
Ctrl K =e
Ctrl K Eu
☺



get the UTF-8 code for the letter under the cursor
https://vi.stackexchange.com/questions/555/see-the-unicode-code-point-of-the-current-character
ga
g8


find non-ascii characters in a vim file

## Symbols
```
/[^a-zA-Z0-9-: #\/\.,)("']  # Donaghs recipe
/[^\d0-\d127]               # Where d0 represents the first ASCII and d127 the 128th
/[^\x00-\x7F]

:h %u
\%d123  Matches the character specified with a decimal number.  Must be followed by a non-digit.
\%o40   Matches the character specified with an octal number up to 0377.  Numbers below 040 must be followed by a non-octal digit or a non-digit.
\%x2a   Matches the character specified with up to two hexadecimal characters.  \%u20AC Matches the character specified with up to four hexadecimal characters.
\%U1234abcd     Matches the character specified with up to eight hexadecimal characters.


replace a non-ascii character
example find and replace   with the ascii "

 1. cursor over the character and yl to yank into the " register
 :s/<Ctrl-R ">/"/g ie after the first / press Ctrl-R then " to paste
 the contents of the " register into the command line
 after pressing enter the substitution should be made
 for the whole file
:%s/<Ctrl-R ">/"/g

 To search for the symbol █
/\v%u2588
 to replace █ with | do this:
:s/█/|/g
 █ is Hex 2588
 or
:s/\%u2588/|/
 try it
 █ is Hex 2588
 █ is Hex 2588

 to enter this non-ascii character --> ” [ Note: that character is not " ]
 ```

Ctrl-V u 201d       # hexadecimal - takes 4 digits

To enter special characters
Ctrl-V 221          # decimal - takes 3 digits
Ctrl-V o A33        # octal - takes 3 digits
Ctrl-V O 3FE        # octal - takes 3 digits
Ctrl-V x 201d       # hexadecimal - takes 4 digits
Ctrl-V X 201d       # hexadecimal - takes 4 digits
Ctrl-V u 201d       # hexadecimal - takes 4 digits
Ctrl-V U 201dd321   # hexadecimal - takes 8 digits

 Note: Ctrl-Q is an alternative to Ctrl-V

 to identify what unicode number ” is place cursor on it then type
ga

 Output: <”> 8221, Hex 201d, Oct 20035, Digr "9

# COMMON SYMBOLS
see also  /home/donagh/PORTABLE_ENV/dotfiles/cheat/vim-digraphs
```
°	DG	0xb0	176	DEGREE SIGN

℠ 	™ 	© 	® 	¶ 	† 	‡ 	– 	±
SM 	TM 	Co 	Rg 	PI 	/- 	/= 	– 	+-
§ 	µ 	£ 	¢ 	¥ 	¤
SE 	My 	$$ 	Ct 	Ye 	Cu
★ 	☆ 	♡ 	◆ 	◇
*2 	*1 	cH 	Db 	Dw
✓ 	✗
OK 	XX

### Dots and bullets
⋅ 	· 	○ 	∙ 	∘ 	∴ 	∵ 	∶ 	∷
.P 	.M 	0m 	Sb 	Ob 	.: 	:. 	:R 	::
⊙ 	⊚ 	◎ 	□ 	▪
0. 	02 	0o 	OS 	sB


### Math
ø 	≃ 	≅ 	≥ 	≤ 	≡ 	≮ 	≯ 	≠
o/ 	?- 	?= 	>= 	=< 	=3 	!< 	!> 	!=
√ 	× 	÷
RT root 	/\ times 	-: divide
⊂ 	⊃ 	∩ 	∪
(C subset 	)C superset 	(U intersection 	)U union
¼ 	½ 	¾ 	₃ 	₂ 	³ 	²
14 	12 	34 	3s 	2s 	3S 	2S

### Greek
Α 	α 	Β 	β 	Γ 	γ 	Δ 	δ 	Ε 	ε 	Ζ 	ζ
A* 	a* 	B* 	b* 	G* 	g* 	D* 	d* 	E* 	e* 	Z* 	z*
Η 	η 	Θ 	θ 	Ι 	ι 	Κ 	κ 	Λ 	λ 	Μ 	μ
Y* 	y* 	H* 	h* 	I* 	i* 	K* 	k* 	L* 	l* 	M* 	m*
Ν 	ν 	Ξ 	ξ 	Ο 	ο 	Π 	π 	Ρ 	ρ 	Σ 	σ 	ς
N* 	n* 	C* 	c* 	O* 	o* 	P* 	p* 	R* 	r* 	S* 	s* 	*s
Τ 	τ 	Υ 	υ 	Φ 	φ 	Χ 	χ 	Ψ 	ψ 	Ω 	ω
T* 	t* 	U* 	u* 	F* 	f* 	X* 	x* 	Q* 	q* 	W* 	w*


### Arrows
← 	→ 	↑ 	↓ 	↕ 	↔
<- 	-> 	-! 	-v 	UD 	<>
⇐ 	⇒ 	⇔
<= 	=> 	==
《   》
>+  +>
» 	« 	〈 	〉 	‹ 	›
>> 	<< 	</ 	/> 	<1 	>1 -〈
▲ 	△ 	▼ 	▽▽
UT 	uT 	Dt 	dT
▶   ▷  ◀   ◁
PR 	Tr 	PL 	Tl

```

## Emojis real

- In vim the following will get closest to 'real' emojis
Press insert (i) then Ctrl-V i.e. <c-v> and type in U0001f600 or whatever your choice is

```
    <c-v>U0001f600 😀 128512
    <c-v>U0001f601  128513 (Decimal) 😁
    <c-v>U0001f602 😂
    <c-v>U0001f603 😃 128515
    <c-v>U0001f604  = 128516 (Decimal) 😄
    <c-v>U0001f605 😅
    <c-v>U0001f606 😆

    😀
```
Also in insert mode for ☺ press Ctrl-K 0u


# Uniquify lines in a text
sort u

# Insert a range of lines from another file

:put =readfile('/path/to/foo/foo.c')[146:226]
 or
:r! sed -n 3,7p /path/to/foo/bar.md

# To read in the 3 lines After 'CHALLENGE' in the specified file
r! grep -A3 "CHALLENGE" /path/to/foo/bar.md


# 0nline vim docs
https://www.vim.org/docs.php

# Doom-emacs like save file
w[SPC] # which is SPC w SPC as I have SPC mapped to : and the muscle memory carries over to doom-emacs.


# Bulk rename files using vim and ranger

$ vidir
See: cheat rename

# Change the point at which a sentence wraps
set textwidth=79

# Registers

There are ten types of registers:
1. The unnamed register ""
2. 10 numbered registers "0 to "9
3. The small delete register "-
4. 26 named registers "a to "z or "A to "Z
5. Three read-only registers ":, "., "%
6. Alternate buffer register "#
7. The expression register "=
8. The selection and drop registers "*, "+ and "~
9. The black hole register "_
10. Last search pattern register "/


# Windows
resize windows
Maximize current window
C-W _
Equalize windows
C-W =
 Incrementally in- de- crease window
C-W +
C-W -
 Increase current window by 10 units
10 C-W +

# DELETE BLANK LINES
:g/^\s*$/d
OR
:%v/./d

# Insert filename / filepath
<C-r>%  # full filepath - insert mode
,d      # normal mode

In the CLI
 <command> | vim - opens a vim file with the output of <command>
-> % ll | vim -





####

# To edit a macro called @l


"lp                 # paste the macro into the buffer to edit it
yada-yada         # the macro in @l now pasted into the current buffer NOTE: this line contains non-utf8 characters
yada-yada-yada    # revised macro after editing NOTE: this line contains non-utf8 characters
B"hyE               # command to edit macro and replace it with the previous line but place the macro now in @h


# Live update of <filename> in a pdf viewer with the <filename.md> open in say, Okular
:!pandoc % -o %:t:r.pdf


 use "= to print the $VIMRUNTIME into the current buffer
 "=&rtp
 then press p for paste

# PWD paste current full filepath into current buffer

Consider getbufinfo() for loads of info

In normal mode

:put=expand('%:p')<cr> # set to <leader>d for directory
In insert mode
<C-R>=getcwd()<cr> # set to <leader>dp
 followed by
<C-R>%

# go to a file
 gf with the cursor on the following line will open that file in a new tab (see .vimrc)
~/DONAGHS/personal/journal/2021/11/26-11.md
 Ctrl o reverts to departure file
# go to a URL link

 gx with the cursor on the following line will open that resource in a browser
https://github.com/jceb/vim-orgmode/blob/master/doc/orgguide.txt

# python spaces / tabs
:retab # fixes tabs / spaces
:set lcs+=space: # shows a . for each space
:set list # displays the .
:set nolist # hides the .
plugin --> git clone https://github.com/Yggdroot/indentLine
 For code indented with tabs I think there is no need to support it, because you can use :set list lcs=tab:\|\

# sudo trick
:w !sudo tee %

# NUMBERED LIST

 Method #1
 Visual select lines and ,n

 Method #2
 record this macro and start with cursor on first line
 The list should have a blank line at the end
 The actual keys are the entire sequence: ^<C-V>}kI0. <Esc>gvg<C-A> (Try it here!)
 ^^V}<80>kuI0. ^[<80><fd>ag

 Method #3
 Select your lines in visual mode with: v, then type/copy into ex mode
    ```
    |:s/^\s*\zs/\=(line('.') - line("'<")+1).'. '

    ```

# EDIT AN EXISTING MACRO

 make a new scratch buffer to edit the macro in <leader>c   c because s c ratch  has 2 letter c's in it and s is taken
 this function is defined in my vimrc
 move to the scratch buffer <C-j>
 paste the contents of the relevant macro e.g. if macro is in the d register do this: "dp
 do the edit then yank the newly-edited macro back into the register: "dyy
 et voilá

# View & Edit the ex Mode history
```
in normal mode
q:

the cgn trick to change any no. of occurences of a word
cursor on word, *, then cgn, then .   That last . is the repeat character not a period!
cgn = change goto next (word)

when searching I have / mapped to /\v to engage very magic search which means '[ (' etc. don't need to be escaped
```
# Vim path
```
path is a list of directories which will be searched when using the gf, [f, ]f, ^Wf, :find, :sfind, :tabfind and other commands,
provided that the file being searched for has a relative path (not starting with "/", "./" or "../").
set path= (then TAB)
path=.,/usr/include,,           :: the default path(s) for vim
to add, say, ~/REPOS/books to the path
set path+=~/REPOS/books        :: can be set in .vimrc; it means that :find etc. will search in the given directory for the file.

```
# Find  a file

find 2Read.md

# Find a file and open in a new split

:sfind 2Read.md

# REGEX
```
:h regexp and http://vimregex.com/
 wordboundary \< and \>
:s/\<vim\>/VIM/g
# \zs & \ze
:s/\zsREPOS\ze/REPOSITORIES/g
# Very Magic in substitions allows not escaping the ( and )
# example1: repos (repositories) REPOSITORIES :: try the below on this lin
:s/\v(repos)/\1zz/ig
# example2: foo foo foo foo :: the following search will match only the final foo(d)
/.*\zsfoo
# example3: Lookbehind - find bar but only if it is preceded with foo
# foobar
# bazbar
# foobar
# quxbar
/\v(foo)@<=bar
```

# Edit commands history
Ctrl-f  (in command mode)
q:      (in normalmode)

# Edit the contents of a dir in a vim buffer
 Method 1
vidir
 Method 2 - uses basic vim!
:r !ls

# Turn off the highlight to the underscore in markdown. NOTE: Solved in .vimrc/Markdown section.
:hi link markdownError Normal


# To convert a file to pdf in vim

map <F5> :!pandoc % -o %:t:r.pdf<cr>    # NOTE: needs a pdf-engine like pdflatex; LaTex or TexLive may be used

The :t and :r are called filename modifiers.

# FUNCTIONS
Examples

open my journal in a new tab
function! Myjournal()
    let year = strftime('%Y')
    let month = strftime('%m')
    let day = strftime('%d')
    let path = '/run/media/donagh/01d4c077-4709-4b5b-9431-087bc9060d68/DONAGHS/personal/journal/'.year.'/'.month
    let filen =  path.'/'.day.'-'.month.'.md'

    execute ":tabe ".filen
endfunction

To open my journal in a new tab
nnoremap mj :call Myjournal<cr>

# Simple arithmetic function
```
let g:sum=0
function SumNumbers(num1,num2)
    let l:sum = a:num1+a:num2
    "check if previous sum was lower than this
    if g:sum < l:sum
        let g:sum=l:sum
    endif
endfunction

# test code
call SumNumbers(3,4)
# this should return 7
echo g:sum

```

# JUMPS
jump lists     jumps are remembered in the jump list saurce of pnai
:changes      lists the changes made to the file; use g; and g, to navigate this in normal mode
:jumps        jumps are things like searches, finding marks; to navigate the jumps use Ctrl-o (backwards) and Ctrl-i (forwards) : will go to other files
A "jump" is a command that normally moves the cursor several lines away.

```
The following commands are "jump" commands: "'", "`", "G", "/", "?", "n", "N", "%", "(", ")", "[[", "]]", "{", "}", ":s", ":tag", "L", "M", "H"
```

# SPELLING
setlocal spell   'misspelt' words will be underlined. Navigate using [s (previous) ]s (next)
Ctrl-N            Used in Insert mode; drop-down list of word suggestions; insert mode; word must already be used earlier in the buffer;
 autocomplete / spelling
 first few letters of a word in the text then (Insert mode) Ctrl+P or Ctrl+N

 zg                add words to spellfile; this file will be created at /home/donagh/.vim/spell/en.utf-8.add (no .spl extension)
 spelling - get corrections
 z=                in Normal mode, z= will bring up big list of suggestions for spell correction; use 1z= to select the first one;
                   (with or without :set spell) try it - z=spelling

# MACROS
 In Insert mode Ctrl-R <letter>   put the contents of register <letter> into the buffer; useful for making re-usable functions or editing macros.


# SESSIONS
Open file where you left off
mksess! and open with vim -S
 To go to the same place you were in a document after closing, use vim sessions. You issue a ":mksess!" and vim will drop a Session.vim file in your current directory. This will store all the docs you had open and where you were in them. Then when you start vim, do "vim -S" to take you back to exactly where you were.
Not sure about the above. I have an alias vx which opens a file called scratch.md and I add :mksession! to allow me to return to the position on opening


# INFO
 To display file data - for word count etc.
 Use airline or in normal mode g C-g

# VIM PLUG
 A modern plugin manager. Started using this 2022-02-05
install
cd ~/.vim/autoload
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

INSTALL NEW PLUGIN - 2 steps
cd ~/PORTABLE_ENV/vim/dot_vim/plugins and then (usually)
-> % git <git path to repo>
then in  /home/donagh/PORTABLE_ENV/vim/plugins/plugins.vim
add e.g.
Plug 'https://github.com/vim-airline/vim-airline.git'

# COMMAND INFOLINE
 the command info line - that empty line below the airline strap
 to change it's height to 2 (ie 2 lines)
:set cmdheight=2

# Quickfix list and Location list
The quickfix list is a data structure that holds file positions.
Essentially, each entry in the quickfix list consists of a file path, a line number and optional column, and a description.

Actually there are two kinds of lists: quickfix and location lists. They behave almost the same, but have the follwing differences:
There is only one quickfix list. There can be multiple location lists; one per window.
They use slightly different commands for navigation.

Action 	        Quickfix 	Location
open window 	:copen 	    :lopen
close window 	:cclose 	:lclose
next entry 	    :cnext 	    :lnext
previous entry 	:cprevious 	:lprevious
first entry 	:cfirst 	:lfirst
last entry 	    :clast

# Quickfix usage example

The quickfix list is populated when you run commands such as :grep.
```
    :grep ugly -r **/*.txt

```
This will populate the quickfix list with a list of files with the word 'ugly' in them. You can use :copen or :clist to look at the files manually.

to get the hex of a character place cursor on character and in noral mode type
ga

Mdash  digraph -M (often occurs when pasting in from the browser)
```
    —  \%u2014
```
to replace with [spc]-[spc] do
```
    :%s/\%u2014/ - /g
HINT :help %u

```

# To convert the annoying, illegible first line into the second line use @h where h contains :s/\%u2014/ - /g

1. these—for the most part—are not good enough
2. these - for the most part - are not good enough

# To put :s/\%u2014/ - /g into the h register, use "hdd


# Later / earlier
earlier 15
later 40

Also very useful is
g+ and g-
to go backward and forward in time.
This is so much more powerful than an undo/redo stack since you don't lose the history when you do something after an undo.

# Dump, say, ls into the current buffer

Note  :! [command] executes an external command while you're in Vim.
But add a dot after the colon,
:.! [command]
and it'll dump the output of the command into your current window. Eg open a new buffer in $HOME then :. ls and the contents of $HOME will be pasted in.


# VIM

## DIRECTORIES
significant directories & files
$MYVIMRC = ~/.vimrc
$VIM = /usr/share/vim
$RTP = ~/.vim

 Ctrl R, in Ex mode,  with...
% --> Current file name
" --> Last yanked text
* --> Clipboard contents
/ --> Last search pattern

## Use vim with NO packages
vim -u NONE <filename>
 or no vimrc
vim -u NORC <filename>
 or use a particular (eg minimal vimrc)
vim -u /home/donagh/PORTABLE_ENV/vim/vimrc_files/minimal_vimrc ~/files/sample_files/README.md

# See how quickly Vim starts without your existing configuration:
simple easy vim (for later searching - trust me!)
vim --clean --startuptime clean.log <fileName>

## Check what may be slowing down vim
vim --startuptime start.log afile.txt # will create start.log listing the time taken for each operation / plugin

# Toggle case

~ one letter at a time
g~ <movement> e.g. g~$ toggle each letter to end of the line
 For toggling Title Case, CamelCase, dashed-case, underline_case use Tim Pope's Abolish.
 Tim Pope's crX command (one word at a time) from his Abolish plugin: https://github.com/tpope/vim-abolish looks good. Use macros to do a sentence or more.
 Also consider using the Unix utility tr or sed or some regex.

# Remove trailing spaces
:%s/\s\{0,\}$//


# Remove duplicate lines
Sort all lines and remove duplicates.
:sort u

Don't sort lines
:g/^\(.*\)$\n\1/d


Use awk to remove all duplicate lines, keeping their order.
:%!awk '\!_[$0]++'


# Status line warnings
trailing, mix-indent-file

[573]trailing means that you have trailing whitespace on line 573, meaning that there are spaces/tabs/other whitespace following the last non-whitespace character on that line.

[515]mixed-indent means that line 515 has indentation with both tabs and spaces.

# Colorscheme
:colorscheme <space> Ctrl d     :: list of available colorschemes
:colorscheme <space> Tab        :: select from one of available colorschemes



# Regex
Lookaround examples using test "foobar foo barfoo"

## 1. Match foo which is not followed by bar: 
> /foo\(bar\)\@!

foobar foo barfoo
       ^      ^
       two matches here

## 2.  Match foo which is preceded by bar: 
> /\(bar\)\@<=foo

foobar foo barfoo
              ^
              one match here

## 3.  Match foo which is not preceded by bar: 
> /\(bar\)\@<!foo

foobar foo barfoo
^      ^
two matches here

## 4.  Match foo which is neither followed nor preceded by bar:
> /\(bar\)\@<!foo\(bar\)\@!

foobar foo barfoo
       ^
       one match here

## 5. Match foo which is followed by bar:
> /foo\(bar\)\@=

foobar foo barfoo
^
one match here

# \ze and \zs for positive lookaround

We may also use \zs and ze for positive lookbehind and lookahead. 
\zs means that the actual match starts from here and \ze means that the actual match ends here. 
Take the above foobar text as an example: foobar foo barfoo

    Match foo preceded by bar: \bar\zsfoo
    Match foo followed by bar: foo\zebar

In the above two match, bar is not part of the match. You can see that\ze and \zs simplify the pattern for positive lookaround.
Think of zs meaning start 
Think of ze meaning end

# Save every line of a buffer to a new file

:g/^/exe ".w ".line(".").".txt" 
saves each line in the buffer to a separate file.
i love (parens) and then some

# Special arguments                       

> Some special arguments are <silent> <Cmd> <buffer> <unique>

The Vimscript function strftime is executed when the abbreviation cdate is used.

:iab <expr> cdate strftime('%Y-%m-%d') - 

> In that example the special argument is <expr> which says to run the function strftime

Execute the command :delete without leaving INSERT mode.

:inoremap <c-d> <Cmd>delete<cr> 

# END
