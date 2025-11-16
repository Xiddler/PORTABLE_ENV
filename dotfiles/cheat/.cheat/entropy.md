# FRONTMATTER
Opened
Filepath 

# Entropy
# =============================================================================================================

To calculate the entropy of a password

E = log₂(R^L)

where:
    E stands for password entropy, measured in bits.
    Log2 is a mathematical formula that converts the total number of possible character combinations to bits.
    R stands for the range of characters.
    L stands for the number of characters in a password.

## Example 1:

correct horse staple battery

R = 2084                :: being the "dictionary" of random words that the four are picked from
L = 4

E = log₂(2085 ^ 4) = log₂(1.75921860444e+13)

E = 44.1                :: I used Omnicalculator at https://www.omnicalculator.com/math/log-2

Check

If the attacker can crack at a rate of 1000000000 (one trillion) — considered conservative! — per second it will take
1.759e+13/1000000000 seconds

or
4+ minutes, in Father Ted speech, not a very, very long time

NOTE:
The password "correct horse battery staple" would take approximately 550 years to crack using a brute force attack, assuming a guessing rate 
of 1,000 attempts per second. This is due to its length and the use of common words, which increases its complexity compared to typical passwords.

## Realistic hack rate

10 trillion per second for a determined, savvy hacker.


## Example 2:

rg8Ql34g

R = 52
L = 8

E = log₂(52 * 8) = log₂(416)

E = 8.7

Check
In [5]: 2**8.7
Out[5]: 415.8



# =============================================================================================================
# FOOTNOTES

