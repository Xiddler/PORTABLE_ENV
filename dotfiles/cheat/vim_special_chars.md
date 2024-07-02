Opened 2024-01-12
File vim_special_chars.md


See also ~/.cheat/vim_digraphs.md
See also zim-wiki  EDITORS:Vim:to learn:special-characters

# Tips

Use `ga` to check the actual value of the character under the cursor

# Special Characters

I run into problems in markdown when I use certain characters at the beginning of a line, notably - (dash) and > (greater than sign)
These have special meanings in markdown and I want to use similar looking characters. Hence this file.

# To insert special characters in vim using decimal, Hex or Octal

In INSERT mode, Ctrl-Q u276f
❯
I have mapped <leader>a to do this in .vimrc Custom Leader


# The prompt from pure-promt ❯

❯ --> <❯> 10095, Hex 276f, Octal 23557
NOTE: this is not a greater-than sign

# The longer hyphen to distinguish it from a dash —

I have an alias for this in .vimrc - in insert mode simply — (for long hyphen)

