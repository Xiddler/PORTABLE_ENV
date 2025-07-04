# FRONTMATTER
Opened 2024-01-12
File vim_special_chars.md
Links ~/.cheat/vim_digraphs.md; ~/.cheat/unicode.md (also ~/.cheat/symbols.md which is a clearing house for all of them)
URL1: https://www.joelonsoftware.com/2003/10/08/the-absolute-minimum-every-software-developer-absolutely-positively-must-know-about-unicode-and-character-sets-no-excuses/

About: long dash —, pure-prompt ❯ etc.

See also zim-wiki  EDITORS:Vim:to learn:special-characters

# Tips

Use `ga` to check the actual value of the character under the cursor. 

From ref URL1 above
"If there’s no equivalent for the Unicode code point you’re trying to represent in the encoding you’re trying to represent it in, you usually get a little question mark: ? or, if you’re really good, a box. Which did you get? -> � "

# My issues with special characters

I run into problems in markdown when I use certain characters at the beginning of a line, notably - (dash) and > (greater than sign)
These have special meanings in markdown and I want to use similar looking characters. Hence this file.

# To insert special characters in vim using decimal, Hex or Octal

# To insert the letter `A` using the Unicode for it

In INSERT mode, Ctrl-Q u0041
A



# To insert the prompt from pure-prompt ❯

In INSERT mode, Ctrl-Q u276f
❯ this is the Pure prompt arrow

I have mapped <leader>> to do this in .vimrc ~/.vim/mappings.vim --▷  Custom Leader
❯ 


Using ga on the first symbol of the next line:
❯ --> <❯> 10095, Hex 276f, Octal 23557
NOTE: this is not a greater-than sign
>


# The hyphen, minus sign, n-dash, m-dash etc.

URLS:
[how to use m-dash and n-dash correctly](https://www.lighthouseproofreading.co.uk/blog/how-to-use-an-en-dash-and-em-dash-correctly)
[unicode explorer](https://unicode-explorer.com/)


I have an alias for this in .vimrc - in insert mode simply `lh`  — (for long hyphen; it's actually the M-dash — but it "should" be the N-dash)

single: unicode 45 (regular minus sign)     -
double: unicode 8211 (en dash)              –
triple: unicode 8212 (em dash)              — 

In vim insert mode you can type -, `Ctrl+k -M` and `Ctrl+k -N` to insert them.

Fun fact: Vim ^K sequences follow RFC1345, but nobody else does.


These are NOT the same:  − – — - ‒  

 − Digr -2; U2212; proper minus sign because it has the same width as the plus sign + (the symbol on the keyboard — Digr 43)
 – Digr -N; U2013; shows an inclusive range eg 7–10pm or approx. 1200–1500 years ago. Also "Book club – more like wine club – was every Wednesday night"
 — Digr -M; U2014; meant to be used thus: Book club—more like wine club—was every Wednesday night. (Personally, I freaking hate this usage)
 ‒ none;    U2012; used in, for example, "Guess the PIN: 1‒34." i.e. a single-digit width horizontal line;
 - none;    U2D;   the dash on the keyboard; the symbol used in Markdown lists (along with *); Hence it is highlighted here;

 Hyphens
 ‐ Digr -1; U2010; used to create a compound word; eg  hyphen‐ated which of course is not hyphenated.
 ‑ none;    U2011;
 ⁃ none;    U2043;
 ﹣none;    UFE63;
 －none;    UFF0D;
 ᠆ none;    U1806;
 ﹘none;    UFE58;

 And
 _ none;    U005F; named low line; we might call it underscore;
 ＿none;    UFF3F;

# The tick mark
✓ Digr OK  Hex 2713

# The Euro symbol

Є in the title of the HN submission is not the Euro symbol.  € is.


€ made using Ctrl K Eu
Є mand using Ctrl K IE




