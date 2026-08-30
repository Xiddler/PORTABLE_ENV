# FRONTMATTER
Opened 2026-08-13 
Filepath 
URL https://refp.se/articles/your-shell-and-the-lazy-exclamation-mark

# fc — CLI utility

-%> man fc


Whether or not your shell speaks !, fc belongs in your imaginary tool belt. It can be used to repeat the previous command, but the true power lies in the fact that you can edit your command-line not in your shell — but in your editor of choice.

Every shell adventurer should run fc at least once a year, if only to marvel at its usability:

$ fc      # edit the previous command
$ fc -2   # edit the command 2 steps back
$ fc grep # edit last command starting with grep

$ fc -3 -1  # the last three commands, all in one buffer
$ fc ssh -1 # from the last 'ssh' line through the most recent one

$ fc -s ssh             # repeat last command starting with 'ssh'
$ fc -s hello=world ssh # replace "hello" with "world" on the line starting with 'ssh'

fc will invoke whatever program is specified in $FCEDIT to do the editing, if no such specification exists POSIX falls back to ed — though many shells will default to $EDITOR.

You may also specify which editor to invoke using -e:

$ scp api.tar.gz prod-01:/tmp
$ ssh prod-01 systemctl restart api
$ curl -sf https://prod-01/health

$ fc -e 'sed -i s/prod-01/test-01/g' -3 -1

The above will rerun all three commands, replacing prod-01 with test-01 in each; a contrived example perhaps but man is it useful when you find yourself in such trouble.

    Note

        fc lives in the User Portability Utilities of POSIX.
        Truly minimal shells like dash and busybox ash ship without it entirely.







