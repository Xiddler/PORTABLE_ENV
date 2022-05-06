# For vim
# (note use ga over a character to see its digraph, hex and octal)

# Ex1 a USV character (Unicode Separated Value)
␟ insert mode Ctrl V then u241f

# Ex2 
¿ insert mode Ctrl V then u00bf


# When you’re in insert mode, you can type <c-v> (or <c-q>), followed by a letter specifying the format of the number representing the character.
# The letters are:

    nothing: decimal 3-digit value, max 255
    o/O: octal 3-digit value, max 377 (same as 255 in decimal)
    x/X: hex 2-digit value, max ff (same as 255 in decimal)
    u: hex 4-digit value, max ffff (same as 65535 in decimal)
    U: hex 8-digit value, max 7fffffff

# Ex 3 the Majuscule U
U insert mode Ctrl V then 85<space>
 







