X clipboard on Linux


Freedesktop.org describes the two main selections as follows:

# Definitions

## PRIMARY

Used for the currently selected text, even if it is not explicitly copied, and for middle-mouse-click pasting. 
In some cases, pasting is also possible with a keyboard shortcut.

## CLIPBOARD

Used for explicit copy/paste commands involving keyboard shortcuts or menu items. 
Hence, it behaves like the single-clipboard system on Windows. 
Unlike PRIMARY, it can also handle multiple data formats.


# Associated utilities and commands

## CLI utilities
sselp           :: Simple X selection printer. Prints the X selection to stdout.
xclip           :: A lightweight, CLI-based interface to the clipboard; use with -selection clipboard to access the CLIPBOARD as described above
xclipboard      :: xorg-xclipboard; X clipboard manager
xsel            :: Command-line program for getting and setting the contents of the X selection.
clipit
clipcopy        :: can't find this but it may have been available in Ububntu
clipcat         :: Clipcat is a clipboard manager written in Rust Programming Language

##  GUI 

Copyq           :: GUI with pinning available

