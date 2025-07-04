Opened 2024-01-11

# about
Calculators on the command line



# echo / bc

->% echo "3 + 4.3 * 55.07" | bc

# bc
->% bc
55 * 34003

# dc
->% dc
44 * 3466


# zcalc
❯ zcalc
1> 44 * 5534
243496

❯ zcalc -i
1> -11
2> 3 ** 3
27
3> 3 * sin(44)
0.0531058
4>



# perl
perl -E 'say 23 * 39'
897



# tclsh
❯ tclsh
% expr 33 * 349
11517


# python / bpython

use python syntax

# zsh/mathfunc
Note: initialize once with ->% zmodload zsh/mathfunc

(( a = sin(44) * 44 )) && echo $a 
0.7788847046


# expr

Integers only!
❯ expr 125 / 3
41

# qalc

->% qalc -i
> 33 * 44456

  33 × 44456 = 1467048
