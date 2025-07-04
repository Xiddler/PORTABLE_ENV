Opened qq


# Checking the integrity of downloads

## sha256sum

->% sha256sum -c sha256sum.txt --ignore-missing
Output
...


## b2sum

->% b2sum -c b2sums.txt --ignore-missing
Output
...


## gpg
Preliminary for Arch download
->% gpg --auto-key-locate clear,wkd -v --locate-external-key pierre@archlinux.org

->% gpg --verify archlinux-2024.01.01-x86 64.iso.sig

gpg: assuming signed data in 'archlinux-2024.01.01-x86_64.iso'


