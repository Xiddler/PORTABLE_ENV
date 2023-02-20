#!/usr/sbin/env bash 

set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR


# a script to automatically check the status of my 4 main git repos
# 1. ~/DONAGHS/personal
# 2.  ~/DONAGHS/MY_ZIM/Computer
# 3.  ~/Dropbox/org-mode/org
# 4.  ~/PORTABLE_ENV

# and offer an option to git add 1) each in turn or 2) all in one go
#
# and offer an option to git commit -m 1) each in turn or 2) all in one go
#

git_dirs=( ~/DONAGHS/personal ~/DONAGHS/MY_ZIM/Computer ~/Dropbox/org-mode/org ~/PORTABLE_ENV )

for dir in ${git_dirs[*]}; do
    echo $dir
    cd $dir
    git add \.
done

for dir in ${git_dirs[*]}; do
    cd $dir && git status
    sleep 2
done

echo "All repos now 'git added'       Relax."
echo "=========================="
echo " "

# choose to commmit 
echo -n "Do you wish to git commit each of the repos now (y for yes): " 
read ans

# committing this way doesn't seem to work for ~/PORTABLE_ENV so exclude that dir 
git_dirs=( ~/DONAGHS/personal ~/DONAGHS/MY_ZIM/Computer ~/Dropbox/org-mode/org )

if [ $ans == "y" ]; then
    for dir in ${git_dirs[*]}; do
        sleep 1
        echo $dir
        cd $dir && git commit -m "message placeholder"
        # use git commit --amend  to amend the commit ◀  this will open a vim session 
    done
else
    for dir in ${git_dirs[*]}; do
        sleep 1
        echo "$dir Ok, not git committing this repo at this time "
    done
fi
