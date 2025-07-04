# FRONTMATTER
Opened 2025-05-11

zim-wiki LINUX:1Linux Live USB:01installed apps:age

# age encryption utility
# =============================================================================================================


`age` provides 3 methods of encrypting files
1. using the recipient flag (either -r or -R) which uses the public key
2. using a passphrase – requires you to remember the passphrase
3. using SSH keys

I propose the following: When encrypting files for each case use a signifier to show which method was used to encrypt, thus

When using the `recipient` method » myencryptedfile.r.age           :: Note the `r` before .age
When using the `passphrase` method » myencryptedfile.p.age          :: Note the `p` before .age
When using the `SSH` method » myencryptedfile.s.age                 :: Note the `s` before .age


## 1. using the recipient flag method
**ENCRYPT**

Note: It is necessary to create a recipient.txt file only on the first usage for this to work, thus:

Step 1: create a public key file
->% age-keygen -o $HOME/REPOS/encryption/key.txt
Step 2: copy the public key into recipient.txt
->% rg 'public key' mymaster_2025.txt  | cut -d':' -f2 > recipient.txt
 

->% age -o <path-to-output.age file> -R <path-to-recipient.txt> <path-to-file-to-be-encrypted> 

example:
->% age -o /home/donagh/11SignUps_2025-05-01.txt.age -R ~/REPOS/encryption/recipient.txt ~/samba/anonymous_shared_directory/11SignUps/11SignUps_2025-05-01.txt

alternative:

->% age -o /home/donagh/11SignUps_2025-05-01.txt.age -r <PUBLICKEY> ~/samba/anonymous_shared_directory/11SignUps/11SignUps_2025-05-01.txt

**DECRYPT**

using the keygen.txt file

->% age -d -i <path-to-keygen-file> -o <path-to-encrypted-file> 

example:
->% age -d -i ~/REPOS/encryption/mymaster_2025.txt -o mysignupsMay082025.txt 11SignUps_2025-05-08.txt.age





## 2. using the passphrase method

**ENCRYPT**

->% age -o <path-to-output-file.age> --passphrase <sourcefile>

example:
->% age -o ~/11SignUps_May03.txt.age --passphrase ~/samba/anonymous_shared_directory/11SignUps/11SignUps_2025-05-03.txt 

**DECRYPT**

->% age -e -o <path-to-passphrase-file> <encrypted-file> 

example:
->%   age -d -o 11pass.txt ~/11SignUps_May03.txt.age
Enter the passphrase

NOTE: I have a 'standard' age passphrase at ~/REPOS/encryption/mypassphrase.txt

## 3. using SSH keys


->% age -R ~/.ssh/id_ed25519.pub example.jpg > example.jpg.s.age        :: Note: the .pub — requiring the PUBLIC ssh key

->% age -d -i ~/.ssh/id_ed25519 example.jpg.s.age > example.jpg         :: Note the identity file is the PRIVATE ssh key



# =============================================================================================================
# FOOTNOTES

