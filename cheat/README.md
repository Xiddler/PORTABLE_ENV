2020-04-23 

# NOTES
 There is an important caveat when creating symlinks that are meant to be tracked under Git. The reference path of the source file should be relative to the repository, not absolute to the machine.


#ISSUES
##1
There is an issue when I try to edit a cheat that is in /usr/share/cheat.
The change doesn't always seem to stick.
Also, when I try to git commit, I don't seem to capture the files in /usr/share/cheat - sometimes. Not sure what is going on here.

##2
Also, when I edit a cheat using ->% cheat -e vim does this relplace the /usr/share/cheat/vim or what?


# SOLUTIONS
## Workaround
Copy the contents of /usr/share/cheat to dot_cheat_hard
->% cp /usr/share/cheat/* dot_cheat_hard
Then perform the git commit*
The names of these folders are confusing. Raise another issue.

I removed the sym link usr_share_cheat altogether.
->% cp /usr/share/cheat/* dot_cheat_hard
