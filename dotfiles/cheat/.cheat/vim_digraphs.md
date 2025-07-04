# Front matter
filename vim-digraphs.md

Links ~/.cheat/symbols.md; ~/.cheat/vim_special_chars.md; ~/.cheat/unicode.md 
URL [vim-unicode](https://github.com/chrisbra/unicode.vim) ◁ vim plugin installed 2024-11-15

see also 
[WinCompose](https://github.com/samhocevar/wincompose) and 
[Compose_pre](https://raw.githubusercontent.com/mirror/libX11/master/nls/en_US.UTF-8/Compose.pre)


# Vim digraphs 

## Help

:digraphs

In Normal mode `ga` when hovering over a character

:UnicodeName when hovering over a character

URL [vim digraphs online](https://sheet.shiar.nl/digraphs) Excellent cheat sheet
URL [Unicode-explorer](https://unicode-explorer.com/search/) Find any Unicode point eg 'LATIN CAPITAL LETTER A WITH GRAVE' 


## two methods to insert digraphs: 

in INSERT mode

1. Ctrl K                   {char1} {char2}
2. (with :set digraph)   {char1} BS {char2} where BS is BACKSPACE

× (star)X
† /-


# Selection of vim digraphs


€   Eu  20ac   8364 EURO                                        [ alt. Digr =e ]
£	Pd	0xe3	227 POUND SIGN 
℅   co  2105   8453 Care/of
©   Co  00a9    169 COPYRIGHT SIGN                              ©
®	Rg	0xae	174	REGISTERED SIGN                             ®
™   TM  2122   8482 TRADEMARK SIGN                              ™ 
°	DG	0xb0	176	DEGREE SIGN
²	2S	0xb2	178	SUPERSCRIPT TWO
³	3S	0xb3	179	SUPERSCRIPT THREE
´	''	0xb4	180	ACUTE ACCENT
‘   6'  2018        single quote                                Handy in .md files when ' causes issues
µ	My	0xb5	181	MICRO SIGN µ
¶	PI	0xb6	182	PILCROW SIGN
·	.M	0xb7	183	MIDDLE DOT
¸	'',	0xb8	184	CEDILLA
¹	1S	0xb9	185	SUPERSCRIPT ONE
º	-o	0xba	186	MASCULINE ORDINAL INDICATOR
¼	14	0xbc	188	VULGAR FRACTION ONE QUARTER
½	12	0xbd	189	VULGAR FRACTION ONE HALF
¾	34	0xbe	190	VULGAR FRACTION THREE QUARTERS
¿	?I	0xbf	191	INVERTED QUESTION MARK
À	A!	0xc0	192	LATIN CAPITAL LETTER A WITH GRAVE 
√   RT
÷	-:	0xf7	247	DIVISION SIGN
✓   OK 
†   /-              DAGGER
‡   /=              DOUBLE DAGGER
Æ   AE
Ⅸ   9R          ROMAN NUMERAL NINE
☼   SU
☺   0u       zero SMALL U
☻   0U       zero CAPITAL U
°	DG	0xb0	176	DEGREE SIGN
✠   -X          MALTESE CROSS

### Superscripts and subscripts
ₐ  as          LATIN SUBSCRIPT SMALL LETTER A  [ I created the 'alias' `as` using :digraphs as 8336 or :execute "digraphs as " . 0x2090 ]
ₑ  es          LATIN SUBSCRIPT SMALL LETTER E [ I created this using :execute "digraphs es " . 0x2091 ]

2ₙ  nS 

⁴  S4           SUPERSCRIPT FOUR


### Greek alphabet

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


### Digraphs for small Greek letters

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



# Arrows
》  +>
《  >+ 

▶   PR      BLACK RIGHT-POINTING TRIANGLE
◀   PL      BLACK LEFT-POINTING TRIANGLE
▲   UT      BLACK UP-POINTING TRIANGLE
▼   Dt      BLACK DOWN-POINTING TRIANGLE

◁   Tl or lT
▷   Tr or rT
△   uT      WHITE UP-POINTING TRIANGLE
▽   dT      WHITE DOWN-POINTING TRIANGLE


❯ --> <❯> 10095, Hex 276f, Octal 23557 .vimrc --> mappings.vim <leader>>  PURE PROMPT ARROW

→   ->
←   <-

»	>>	0xbb	187	RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK
«   <<  

≪   <* 
≫   *>


