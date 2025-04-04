# Running emacs

  GUI mode            $ emacs           (with doom installed will open doom-emacs for me)
  Terminal mode       $ emacs -nw       No Window (ie no GUI)
  Quick               $ emacs -q        (will open the non-doom raw emacs GUI)
  emacsclient         $ emacs --daemon  (will run the emacs server)

# exit emacs

# "jk" for ESC
# M-x package-install evil-escape 
#To toggle the evil-escape mode globally:

M-x evil-escape-mode

# The key sequence can be customized with the variable evil-escape-key-sequence. For instance to change it for jk:
# Enter the following in config.el
(setq-default evil-escape-key-sequence "jk")

# Basic usage (non-evil mode)

  Indent              Select text then press TAB
  Cut                 CTRL-w
  Copy                ALT-w
  Paste ("yank")      CTRL-y
  Begin selection     CTRL-SPACE
  Search/Find         CTRL-s
  Replace             ALT-% (ALT-SHIFT-5)
  Save                CTRL-x CTRL-s
  Save as             CTRL-x CTRL-w
  Load/Open           CTRL-x CTRL-f
  Undo                CTRL-x u
  Highlight all text  CTRL-x h
  Directory listing   CTRL-x d
  Cancel a command    CTRL-g
  Font size bigger    CTRL-x CTRL-+
  Font size smaller   CTRL-x CTRL--

# Buffers

  Split screen vertically                         CTRL-x 2
  Split screen vertically with 5 row height       CTRL-u 5 CTRL-x 2
  Split screen horizontally                       CTRL-x 3
  Split screen horizontally with 24 column width  CTRL-u 24 CTRL-x 3
  Revert to single screen                         CTRL-x 1
  Hide the current screen                         CTRL-x 0
  Move to the next screen                         CTRL-x o
  Kill the current buffer                         CTRL-x k
  Select a buffer                                 CTRL-x b
  Run command in the scratch buffer               CTRL-x CTRL-e

# Navigation ( backward / forward )
  
  Character-wise                                  CTRL-b , CTRL-f
  Word-wise                                       ALT-b  , ALT-f
  Line-wise                                       CTRL-p , CTRL-n
  Sentence-wise                                   ALT-a  , ALT-e
  Paragraph-wise                                  ALT-{ , ALT-}
  Function-wise                                   CTRL-ALT-a , CTRL-ALT-e
  Line beginning / end                            CTRL-a , CTRL-e

# Other stuff

  Open a shell         ALT-x eshell
  Goto a line number   ALT-x goto-line
  Word wrap            ALT-x toggle-word-wrap
  Spell checking       ALT-x flyspell-mode
  Line numbers         ALT-x linum-mode
  Toggle line wrap     ALT-x visual-line-mode
  Compile some code    ALT-x compile
  List packages        ALT-x package-list-packages

# Line numbers

  To add line numbers and enable moving to a line with CTRL-l:

    (global-set-key "\C-l" 'goto-line)
    (add-hook 'find-file-hook (lambda () (linum-mode 1)))

# math / sexpressions in a buffer
(+ 3 5) C-x C-e
# to print to next line
'eval-print-last-sexpression'
# use ielm a major mode for interactively evaluating Emacs Lisp expressions.

Emacs jargon 	Modern parlance
----------------------------------------------
M-x 	        Alt + x
C-x 	        Ctrl + x
Frame 	        Emacs window
Window 	        split/pane
Buffer 	        Contiguous chunk of text/data
Point 	        Cursor position in a buffer
Active Region 	Text selection
Region 	        Text selection (not highlighted)
Face 	        Font, color and display properties

# open raw emacs in a bubble shell
$HOME/.scripts/bubble_wrap_new_shell.sh 
bwrap-demo$ emacs -nw



# The problem of the EN DASH
When pasting from the web I sometimes get the following:
This was the case–as far as I remember–when there was a blue moon.
I want there to be spaces around that EN DASH
– is %u2013 in vim and 20023 in emacs (in doom-emacs I can also go, in normal mode, ga )
8211, #o20023, #x2013

To replace the EN DASH with SPC-SPC i.e. "EN DASH" with " - "
METHOD 1
Enter --> M-% will bring up a mini-buffer with
Query result:
Enter --> C-X 8 RET
UNICODE NAME
Enter --> 002013
Query replace – with: -
Query replacing – with  - (press y to confirm for each instance and ESC to escape)

METHOD 2
:%s/C-q20023 SPC BACKSPACE/ - /gc

To enter a EN DASH
Insert mode (i)
C-q
20023
–

See also: M-x
describe-char
isearch-char-by-name  (enter EN DASH 

# literate progamming 
# test.org (@6$2 is empty and place the cursor there then the commands that are shown below 
| item  | amount |
|-------+--------|
| food  |    300 |
| rent  |    200 |
| drink |    463 |
|       |        |
| Total |    963 |
#+TBLFM: @6$2=vsum(@2$2..@4$2)

# With nothing in @6$2,
SPC c e RET
# With something in @6$2,
SPC C e RET # capital C there!

# literate programming 
# file contains this table 
|-------+--------|
| food  |    300 |
| rent  |    200 |
| drink |    463 |
|       |        |
| Total |    963 |
#+TBLFM: @6$2=vsum(@2$2..@4$2)

With nothing in @6$2,
SPC c e RET   # small c
With something in @6$2,
SPC C e RET   # capital C 

# END the problem of the EN DASH

