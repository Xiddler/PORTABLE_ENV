Opened 2024-11-15
Filepath ~/PORTABLE_ENV/dotfiles/cheat/symbols.md

Links ~/.cheat/vim_digraphs.md; ~/.cheat/vim_special_chars.md; ~/.cheat/unicode.md; ~/.cheat/ascii;



Symbols

# vim
see
~/.cheat/vim_digraphs.md
~/.cheat/vim_special_chars.md
~/.cheat/unicode.md

# how to

⟫  ◁--  Ctrl-Q U27EB
ᥢ  ◁--  Ctrl-Q U1962

# Selected symbols


  dphs   Hex
⁊       204a        TIRONIAN ET

†   /-              DAGGER
‡   /=              DOUBLE DAGGER
€   eu  20ac   8364 EURO                                        [ alt. Digr =e ]
£	pd	0xe3	227 POUND SIGN 
℅   co  2105   8453 Care/of
©   co  00a9    169 COPYRIGHT SIGN                              ©
®	rg	0xae	174	REGISTERED SIGN                             ®
™   tm  2122   8482 TRADEMARK SIGN                              ™ 
°	dg	0xb0	176	DEGREE SIGN
¹	1s	0xb9	185	SUPERSCRIPT ONE
²	2s	0xb2	178	SUPERSCRIPT TWO
³	3s	0xb3	179	SUPERSCRIPT THREE
⁴   s4  2074   8308 SUPERSCRIPT FOUR
´	''	0xb4	180	ACUTE ACCENT
‘   6'  2018        single quote                                Handy in .md files when ' causes issues
µ	my	0xb5	181	MICRO SIGN µ
¶	pi	0xb6	182	PILCROW SIGN
·	.m	0xb7	183	MIDDLE DOT
¸	'',	0xb8	184	CEDILLA
º	-o	0xba	186	MASCULINE ORDINAL INDICATOR
¼	14	0xbc	188	VULGAR FRACTION ONE QUARTER
½	12	0xbd	189	VULGAR FRACTION ONE HALF
¾	34	0xbe	190	VULGAR FRACTION THREE QUARTERS
¿	?i	0xbf	191	INVERTED QUESTION MARK
à	a!	0xc0	192	LATIN CAPITAL LETTER A WITH GRAVE 
√   rt
÷	-:	0xf7	247	DIVISION SIGN
✓   ok 
†   /-              DAGGER
‡   /=              DOUBLE DAGGER
≈   ?2 
æ   ae
ⅸ   9r          ROMAN NUMERAL NINE
☼   su
☺   0u       zero SMALL U
☻   0u       zero CAPITAL U
°	dg	0xb0	176	DEGREE SIGN
✠   -x          MALTESE CROSS

Superscripts and subscripts

ₐ  as          LATIN SUBSCRIPT SMALL LETTER A  [ I created the 'alias' `as` using :digraphs as 8336 or :execute "digraphs as " . 0x2090 ]
ₑ  es          LATIN SUBSCRIPT SMALL LETTER E [ I created this using :execute "digraphs es " . 0x2091 ]

2ₙ  nS 



Greek alphabet

Α α	Alpha	
Β β	Beta	
Γ γ	Gamma	
Δ δ	Delta	
Ε ε	Epsilon	
Ζ ζ	Zeta	
Η η	Eta
Θ θ	Theta	
Ι ι	Iota	
Κ κ	Kappa	
Λ λ	Lambda	
Μ μ	Mu	
Ν ν	Nu
Ξ ξ	Xi
Ο ο	Omicron
Π π	Pi
Ρ ρ	Rho
Σ σς Sigma
Τ τ	Tau
Υ υ	Upsilon
Φ φ	Phi
Χ χ	Chi
Ψ ψ	Psi
Ω ω	Omega


Digraphs for small Greek letters

α  a*
β  b*
γ  g*
δ  d*
ε  e*
ζ  z*
η  y*
θ  h*
ι  i*
κ  k*
λ  l*
μ  m*
ν  n*
ξ  c*       GREEK SMALL LETTER XI
ο  o*
π  p*
σ  s*
τ  t*
υ  u*
φ  f*        GREEK SMALL LETTER PHI
χ  x*        GREEK SMALL LETTER CHI
ψ  q*        GREEK SMALL LETTER PSI
ω  w*

Other 
〔	U+3014	LEFT TORTOISE SHELL BRACKET
〕	U+3015	RIGHT TORTOISE SHELL BRACKET


# Windows

Win + ; to get access to all symbols including € as well as... (*￣０￣)ノ,  emojis & gifs

## Sample - Euro symbol

€ symbol on Windows — how to?


### Method 1

Type out the letters of euro 	:: this is an AutoHotKey shortcut — works system wide on Windows for me; added 2024-11-14; 



### Method 2

Win + ; to open the Emoji Picker (which includes loads of symbols too!)

Select Symbols (right most icon on the tab line) →  Currency Symbols → pick €

Also has, for example:

✓

NOTE: Emoji Picker uses frecency so € is the first one and stays there

Also, consider "sticking" it in CopyQ ⇐ done!!

€



NOTE: Symbols has the following sub-folders

* General Punctuation		:: § ℉ © ® № ‖ ‰ ※ ✓ ✕ ⁀ ‿ ⁈  ⌂  

* Currency Symbols			:: € 

* Latin Symbols				:: æ

* Geometric Symbols			:: ↪   ↴

* Math Symbols				:: ⅞ ⅚ ⅟ ∃ Ⅷ ∅ ∑ ∏ ∬ ∳ ≈ ≳ ⋃ ⑽

* Supplemental Symbols		:: ⨚⨝⨴⨿⨺⩒⩨ 

* Language Symbols			:: Δ ζ ξ χ ψ Ω ἄ Έ Ἕ ᾕ ἴ Ὃ ᾧ ϴ Ͻ ϐ



### Method 3

Win + R and type in charmap to activate character map pop-up window

Select e.g. font "Arial"

Type in euro  in the search bar. Works!!

### Method 4

Open zim and type \euro to get € and copy/paste that into the application



# Tironian et 7

The sigil/symbo/glyph between P⁊T is called amperagus. In the old Post ⁊ Telegraphs it means "and" supposedly from the Latin et meaning "and".
It took some time to track down the name of it on the internet - because I didn't know it's name, obviously. 
Finally found it on this site: https://sites.psu.edu/symbolcodes/languages/europe/irish/

I then figured out how to type it in vim like I did above. Sure ⁊ looks like a 7 or a ₇ but it's not a seven.

`ga` on it
8266, Hex 204a, Octal 20112

In insert mode: 
Ctrl Q u204a --▷  ⁊





UPDATE:
I googled !g amperagus and it seems that ⁊ is also called the Tironian et. This is something I "knew" before but have forgotten. Hence my urge to
reknow!



"The Tironian symbol ⟨⁊⟩, which signifies the word et in Latin; ocus/agus in Irish, ('and' in English), is a remnant of a shorthand system, the notae Tironianae or   Tironian notes, believed to have been developed by Marcus Tullius Tiro (died c. 4 BC)."
Marcus Tullius Cicero was his boss who asked Tiro to develop a shorthand system similar to the known Greek shorthhand system.
BTW Cicero is translated as Chickpea reflecting Cicero's ancestor's cleft chin. Maybe.



Wikipedia
Tironian notes (Latin: notae Tironianae) are a form of thousands of signs that were formerly used in a system of shorthand (Tironian shorthand) dating from the 1st   century BCE and named after Tiro, a personal secretary to Marcus Tullius Cicero, who is often credited as their inventor.[1] Tiro's system consisted of about 4,000   signs,[2] extended to 5,000 signs by others. During the medieval period, Tiro's notation system was taught in European monasteries and expanded to a total of about   13,000 signs.[3] The use of Tironian notes declined after 1100 but lasted into the 17th century. A few Tironian signs are still used today.
