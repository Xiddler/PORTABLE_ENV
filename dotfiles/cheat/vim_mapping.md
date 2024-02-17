Opened 2024-01-12

Key mapping is used to change the meaning of typed keys.

# Mapping in vim

See https://vimdoc.sourceforge.net/htmldoc/map.html

Beginning...

1. Key mapping				*key-mapping* *mapping* *macro*

Key mapping is used to change the meaning of typed keys.  The most common use
is to define a sequence commands for a function key.  Example:

	:map <F2> a<C-R>=strftime("%c")<CR><Esc>

This appends the current date and time after the cursor (in <> notation |<>|).



1.1 MAP COMMANDS					*:map-commands*

There are commands to enter new mappings, remove mappings and list mappings.
See |map-overview| for the various forms of "map" and their relationships with
modes.


{lhs}	means left-hand-side	*{lhs}*

{rhs}	means right-hand-side	*{rhs}*

