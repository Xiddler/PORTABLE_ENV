#  Create random strings / numbers for passwords etc.

# openssl
 -> % openssl rand -hex 64
b3b6cd7b225d43c102489bdc81fb18cf9d56147cb039e80b517055d34cc515324c930bd9ed0ef5c7ea1873cb88ea3e38b430f5440c96ed2c55c92fffda819de5

-> % openssl rand -base64 10
EDPXfQaQbZqmWg==

##  2 byte unsigned decimal integers,

       od -vAn -N2 -tu2 < /dev/urandom
24352

##  1 byte signed decimal integer,

     od -vAn -N1 -td1 < /dev/urandom
-78

## 4 byte unsigned decimal integers,

     od -vAn -N4 -tu4 < /dev/urandom
3394619386

## man od for more information on od.

# shuf
shuf --random-source='/dev/urandom' -n 1 -i 1-100;
33

# perl & /dev/urandom

    perl -le '
      while (q(
        c char,  C unsigned char, s! short, S! unsigned short,
        i! int,  I! unsigned int, l! long,  L! unsigned long,
        f float, d double,) =~ /(\S+) (.*?),/gs) {
        $size = length(pack $1, 0);
        sysread STDIN, $data, $size;
        print "$2($size): " . unpack($1, $data);
        }' < /dev/urandom

SAMPLE OUTPUT

    char(1): -54
    unsigned char(1): 252
    short(2): 14959
    unsigned short(2): 26606
    int(4): 1047855566
    unsigned int(4): 1829558474
    long(8): -1926811214267716731
    unsigned long(8): 8915695240599939378
    float(4): 5.28013108887683e+17
    double(8): 1.34188535127341e-73

# zsh/bash

zsh
->%  bash -c "echo $RANDOM"
21715
bash
echo $RANDOM


# To generate a random password using /dev/urandom

    sudo < /dev/urandom tr -dc A-Za-z0-9 | head -c14; echo

0moVkjqEVTjWQO
