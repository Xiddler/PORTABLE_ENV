Opened 2022-12-30


# Notes

example of use of paste:

fac() { (echo 1; seq $1) | paste -s -d\* - | bc; }

paste -s puts the output of seq on one line separated by tabs. the -d\* replaces the default delimiter with * which is the symbol for multipy


