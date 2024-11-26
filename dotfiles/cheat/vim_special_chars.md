Opened 2024-01-12
File vim_special_chars.md
About long dash —, pure-prompt ❯ etc.
Links ~/.cheat/vim_digraphs.md; ~/.cheat/unicode.md (also ~/.cheat/symbols.md which is a clearing house for all of them)

See also zim-wiki  EDITORS:Vim:to learn:special-characters

# Tips

Use `ga` to check the actual value of the character under the cursor. 

# Special Characters

I run into problems in markdown when I use certain characters at the beginning of a line, notably - (dash) and > (greater than sign)
These have special meanings in markdown and I want to use similar looking characters. Hence this file.

# To insert special characters in vim using decimal, Hex or Octal

## The prompt from pure-prompt ❯

In INSERT mode, Ctrl-Q u276f
❯ this is the Pure prompt arrow

I have mapped <leader>> to do this in .vimrc Custom Leader
❯ 

Using ga on the first symbol of the next line:
❯ --> <❯> 10095, Hex 276f, Octal 23557
NOTE: this is not a greater-than sign
>


# The longer hyphen to distinguish it from a dash —

I have an alias for this in .vimrc - in insert mode simply `lh`  — (for long hyphen)


