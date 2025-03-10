# Refs

## Webrefs

https://gitimmersion.com/lab_10.html

## Man pages

  man gittutorial
  man giteveryday
  man gitglossary
  man gitworkflows


# Terms in git

    Commit - stores the current contents of the index in a new commit along with a log message from the user describing the changes

    Branch - a pointer to a commit

    Master - the default name for the first branch

    HEAD - a pointer to the most recent commit on the current branch

    Merge - joining two or more commit histories

    Workspace - the colloquial name for your local copy of a Git repository

    Working tree - the current branch in your workspace; you see this in git status output all the time

    Cache - a space intended to temporarily store uncommitted changes

    Index - the cache where changes are stored before they are committed

    Tracked and untracked files - files either in the index cache or not yet added to it

    Stash - another cache, that acts as a stack, where changes can be stored without committing them

    Origin - the default name for a remote repository

    Local repository - another term for where you keep your copy of a Git repository on your workstation

    Remote repository - a secondary copy of a Git repository where you push changes for collaboration or backup

    Upstream repository - the colloquial term for a remote repository that you track

    Pull request - a GitHub-specific term to let others know about changes you've pushed to a branch in a repository

    Merge request - a GitLab-specific term to let others know about changes you've pushed to a branch in a repository

    'origin/master' - the default setting for a remote repository and its primary branch

# ONE LINER git log

git log --oneline --all --decorate --graph


# To set your identity:

## New way

Hint: _includes set_

$ git config set --global user.name "Your Name"
$ git config set --global user.email "your-email@example.com"

## Old way

$ git config --global user.name "John Doe"
$ git config --global user.email johndoe@example.com



# To set your editor:

git config --global core.editor emacs

# To enable color:

git config --global color.ui true

# To stage all changes for commit:

git add --all
git add .


# STASH

To stash changes locally, this will keep the changes in a separate changelist
(ie a cache) called stash and the working directory is cleaned. 
You can apply changes from the stash anytime with:
git stash

## To stash changes with a message
git stash save "message"

## To list all the stashed changes
git stash list

## To apply the most recent change and remove the stash from the stash list
git stash pop

## To apply any stash from the list of stashes. This does not remove the stash from the stash list
git stash apply stash@{6}
## END STASH 

# To commit staged changes
git commit -m "Your commit message"

# To edit previous commit message
git commit --amend

# Git commit in the past
git commit --date="`date --date='2 day ago'`"
git commit --date="Jun 13 18:30:25 IST 2015"
 more recent versions of Git also support --date="2 days ago" directly

# To change the date of an existing commit
git filter-branch --env-filter \
    'if [ $GIT_COMMIT = 119f9ecf58069b265ab22f1f97d2b648faf932e0 ]
     then
         export GIT_AUTHOR_DATE="Fri Jan 2 21:38:53 2009 -0800"
         export GIT_COMMITTER_DATE="Sat May 19 01:01:01 2007 -0700"
     fi'

# To remove staged and working directory changes
git reset --hard

# To go 2 commits back
git reset --hard HEAD~2

# To remove untracked files
git clean -f -d

# To remove untracked and ignored files
git clean -f -d -x

# To push to the tracked master branch:
git push origin master

# To push to a specified repository:
git push git@github.com:username/project.git

# To delete the branch "branch_name"
git branch -D branch_name

# To make an exisiting branch track a remote branch
git branch -u upstream/foo

# To see who commited which line in a file
git blame filename

# To sync a fork with the master repo:
git remote add upstream git@github.com:name/repo.git    # Set a new repo
git remote -v                                           # Confirm new remote repo
git fetch upstream                                      # Get branches
git branch -va                                          # List local - remote branches
git checkout master                                     # Checkout local master branch
git checkout -b new_branch                              # Create and checkout a new branch
git merge upstream/master                               # Merge remote into local repo
git show 83fb499                                        # Show what a commit did.
git show 83fb499:path/fo/file.ext                       # Shows the file as it appeared at 83fb499.
git diff branch_1 branch_2                              # Check difference between branches
git log                                                 # Show all the commits
git status                                              # Show the changes from last commit


# Import commits from another repo
git --git-dir=../some_other_repo/.git format-patch -k -1 --stdout <commit SHA> | git am -3 -k

# View commits that will be pushed
git log @{u}..

# View changes that are new on a feature branch
git log -p feature --not master
git diff master...feature # note the 3 dots not 2 

# rebase
git rebase is a tool for making cleaner histories to be used in conjunction with merge.
eg 
Interactive rebase for the last 7 commits
git rebase -i @~7

GOLDEN RULE:
> "Do not rebase commits that exist outside your local repository and/or that people may have based work on."

# Diff files WITHOUT considering them a part of git
# This can be used to diff files that are not in a git repo!
git diff --no-index path/to/file/A path/to/file/B

# To pull changes while overwriting any local commits
git fetch --all
git reset --hard origin/master

# Update all your submodules
git submodule update --init --recursive

# Perform a shallow clone to only get latest commits
 (helps save data when cloning large repos)
git clone --depth 1 <remote-url>

# To unshallow a clone
git pull --unshallow

# Create a bare branch (one that has no commits on it)
git checkout --orphan branch_name

# Checkout a new branch from a different starting point
git checkout -b master upstream/master

# Remove all stale branches (ones that have been deleted on remote)
 So if you have a lot of useless branches, delete them on Github and then run this
git remote prune origin

# The following can be used to prune all remotes at once
git remote prune $(git remote | tr '\n' ' ')

# Revisions can also be identified with :/text
 So, this will show the first commit that has "cool" in their message body
git show :/cool

# Undo parts of last commit in a specific file
git checkout -p HEAD^ -- /path/to/file

# Revert a commit and keep the history of the reverted change as a separate revert commit
git revert <commit SHA>

# Pick a commit from a branch to current branch. This is different than merge as
 this just applies a single commit from a branch to current branch
git cherry-pick <commit SHA1>

# to see status of remote
git fetch --dry-run --verbose

# To remove a commit done locally: 
git reset --soft HEAD^

 HEAD^ means go back one commit from where HEAD is now. This will get you to the state just before the last commit. 

 To remove a commit you have already pushed to remote: 
 The safest way of removing a commit from remote is to revert the bad commit. Find the commit hash and:
git revert <commit-hash>


# List config
git config --list

# After ssh-keygen...
 -> % eval "$(ssh-agent -s)"
 output is like this: Agent pid 588483
 example
donaghm [13:40 Sat 19/12] [~/SD64/REPOSITORIES/2programming/ssh/ssh_keys_2020] 
-> % ssh-add id_rsa_GH 

# push to ssh using id_rsa
 git push ssh://xiddler@server/opt/project master

# 2020-12-19 using personal access token for git push etc.
git push origin master
user: Xiddler
password: <enter pat here> 
 NOTE: don't put PAT in here (this file is on github!) as Github will prevent it's use which is a good thing.

# set identity
git config --global user.name "Donagh" && git config --global user.email xiddler@gmail.com

# useful actions
    git branch - to find which branch you're on

    git log - to see what commit you're on

    git status - to see what edits you've made since the last commit

    git remote - to see what remote repository you're tracking

    git undo - see https://blog.waleedkhan.name/git-undo/
    
    git reset is the command we use when we want to move the repository back to a previous commit, discarding any changes made after that commit
    git reset --hard - To removed staged and working directory changes (this will delete all 'added' files!)
    git reset <file> - To undo $ git add <file> before a commit 

    git show 

# pretty git log

git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit

alias gll="git log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all -n 15"

## see log of recent 7 days 

Log for last week. Add --author=donagh if I only want to see changes I made.
-> % git log --all --pretty=format:'%h %cd %s (%an)' --since='7 days ago'

## nice log output

-> % git log --pretty=format:'%h %ad | %s%d [%an]' --graph --date=short


## git log pretty
git log --oneline

git log --graph --oneline --decorate --all -50

## Commit history of a set of files
git log --pretty=email --patch-with-stat --reverse --full-index -- Admin\*.py > Scripts.patch

# terminal help
man giteveryday # https://git-scm.com/docs/giteveryday
man gittutorial # https://git-scm.com/docs/gittutorial

# HEAD 
Points to the Last Commit on the current repository i.e. [revision_hash]
 HEAD^ - Last Commit - 1;
 HEAD^^ - Last Commit - 2;
 HEAD~10 - 10 commits behind of HEAD;
 example
-> % git checkout HEAD^^ autokey/l3.py # fails

detached HEAD means that the main/master commit is not checked out and that the HEAD is at another branch.

# git restore -s f0b9ef914c7ca2 autokey/l3.py  ???

git restore --staged <file>
AND
git reset <file>
do the same thing!

# use git blame on PORTABLE_ENV for example
git blame vim/vimrc

# A branch
A branch in Git is only a named pointer to a specific snapshot.

# HEAD
The HEAD of the development is where you last checked out your workspace and, more importantly, where to commit the changes.

# Reflog
A reflog shows what has been changed during the lifetime of the name, from when it was created (usually by a branch) until the current state.

# Create a safe point
IF you want to create a safe point just before doing a tricky merge, just spin off a new branch pointing at the current commit:

git branch blah_branch_backup

Later, if your merge gets completely messed up, you can do:
git merge --abort

WAIT!
This may be right but it is confusing.
Ok, I create a branch with
git checkout -b newfuchingbranch
OR
git branch newfuchingbranch

What then?
Do I checkout main before merging? It's not obvious, you fuckin cunt.
Where do I do the merge from? Which branch? Does it matter?
Too many fucking questions you fucking cunt.

git merge --abort

The merge command is confusing, to say the least... so...

git reset --hard blah_branch_backup

Ok, in case of a fuckup....
That final command will restore the current branch's HEAD to point to the same commit as blah_branch_backup.

This same pattern is useful for other dangerous commands, like rebases or filter-branch.

When you're done, just delete blah_branch_backup. 

# Notes on git / magit                                      ACTION
# STATE: uncreated or unmodified

vim <filename>                                          -- create or modify
# STATE: untracked == unstaged == created or modified

git add <file>     [magit s]                            -- stage or track
# STATE: tracked == staged == uncommitted

git commit -m "<message>"   [magit c]                   -- commit
# STATE: committed

git push origin main                                    -- push (to remote)
# STATE: saved in the cloud

# interactive cheat sheeear
https://ndpsoftware.com/git-cheatsheet.html#loc=local_repo

# hunks
 These are parts of files that you can update interactively. For more help -> % git add --help and search for hunk or patch

# see which credentials I gave at git init
git config -l

# find .git folders
find . -type d -name '.git'  

# My git repositories on laptop
# [ see $HOME/.scripts/manage_all_git_repos.sh ]
$HOME/PORTABLE_ENV/.git
$HOME/Dropbox/org-mode/org/.git
$HOME/DONAGHS/personal/.git
$HOME/DONAGHS/MY_ZIM/Computer/.git
$HOME/DONAGHS/all_org/.git

# global git config file

## The global Git config file is stored in a file uncreatively named .gitconfig in the user’s home directory i.e. $HOME/.gitconfig. 
git config --global --list --show-origin

## check your current global config
git config --global -l 

# git 'undo'
git checkout foo.txt									:: Undo local changes (like svn revert)
git reset HEAD foo.txt									:: Remove from staging area (local copy still modified).

# .git/ folder

The HEAD file tells Git which branch we’re working on 

The config file contains repo-specific configuration. 

The description file is only used by the GitWeb program

The hooks directory is used to store scripts that fire on certain events – for example, running a linter before you commit.

The info directory has a single file, exclude, which contains a list of per-repo ignores. Like a gitignore file, but it doesn’t need to be checked in.

The objects directory should be empty when a repo is git init'ed (aside from two more empty directories)

The refs directory is also empty at the start

# .gitignore file
Should be tracked!

The .gitignore file should be in your repository, so it should indeed be added and committed in, as git status suggests. It has to be a part of the repository tree, so that changes to it can be merged and so on.


# trees & blobs

blobs are like files, trees are like directories. 


# git verbs what they do table

git clone, git init								:: get a repository to work with 
git tag, git branch								:: give commits human readable names 
git diff										:: compare source between commits 
gitk, git log									:: look at the whole graph of commits 
gitk, git switch, git checkout					:: look at a commit both the code content and meta-data 
git stage, git add								:: add commits 
git reset, git restore, git clean, git checkout	:: discard changes both local changes and whole commits 
git rebase, git cherry-pick						:: change/move commits around the graph 
git push, git fetch, git remote, git merge		:: share your code and history with your friends 
git worktree									:: have more than one commit checked out at a time 


# Retrieve a single file from an older hash

> Get a file from a specific commit and put it in a different location
$ git show 8a793c54:org.org > ~/org_old.org

> If you are only interested in viewing the file contents in the terminal you can just run 
$ git show 58a3db6:path/to/your/file.txt

> Other ideas
$ git checkout [revision_hash] [file_name]

> restore is rather old. Git 2.23 Adds Switch and Restore Commands - cf StackOverflow
eg In the folder ~/PORTABLE_ENV/tmux/
->% git restore --staged 2d448a8e33c91 ~/PORTABLE_ENV/tmux/tmux.conf

# UNDOING

## To undo the last commit
->% git reset --hard <commithash> where <commithash> is the hash of the previous commit

## To demote a file from the staged/index("to be committed") list to the "not staged for commit" list

->% git reset HEAD <file>
same as 
->% git restore --staged <file> 

Example:
->% cd  ~/PORTABLE_ENV 
->% git reset HEAD dotfiles/scripts/.scripts/string_length_bash.sh
Unstaged changes after reset:
M       dotfiles/cheat/git.md

## To demote a file from 

# `git diff` to compare two directories

I setup two directories where the second has a new file, a modified file, and a removed file compared to the first:

    $ tree dir1/ dir2/
    dir1/
    ├── empty.txt
    ├── modified.txt
    ├── remove-this.txt
    └── unchanged.txt
    dir2/
    ├── empty.txt
    ├── modified.txt
    ├── new-file.txt
    └── unchanged.txt

Then `git diff --name-status dir1 dir2` outputs the following, showing the changes by file name.

    $ git diff --name-status dir1 dir2
    M       dir1/modified.txt
    A       dir2/new-file.txt
    D       dir1/remove-this.txt

 This also doesn't require running `git init` on the two directories either, so it's immediately usable out of the box.


# find the directory path of all .git/ directories (i.e. git repos) in this directory

->% find . -type d -name "\.git" | xargs realpath 

# archive a repo and tar & compress it

->% cd $HOME/PORTABLE_ENV 
->% git archive --format=tar.gz -o /tmp/my-repo.tar.gz --prefix=my-repo/ main
->% ls /tmp
my-repo.tar.gz

Look at the difference in size ( 2024-07-04 )
->% du -sh my-repo.tar.gz
27M     my-repo.tar.gz

->% cd $HOME
->% du -sh PORTABLE_ENV
196M    PORTABLE_ENV

# count objects in the .git/ folder

git count-objects -v

❯ git count-objects -v              # 2024-07-11
count: 2491
size: 64964
in-pack: 6766
packs: 1
size-pack: 39753
prune-packable: 0
garbage: 0
size-garbage: 0


# view the top 10 largest files in a repo, ordered by size

    ->%  git rev-list --objects --all | grep -f <(git verify-pack -v .git/objects/pack/*.idx| sort -k 3 -n | cut -f 1 -d " " | tail -10)
 

#  delete images (e.g., \*.jpg, \*.png, and \*.gif) existing in history

->% git filter-branch -f --index-filter 'git rm --cached --ignore-unmatch "assets/*.jpg" "assets/*.png" "assets/*.gif"' --prune-empty --tag-name-filter cat -- --all




# CLEANING UP A GIT REPO

https://junyonglee.me/github/How-to-clean-up-git-repository/


->%  rm -Rf .git/refs/original

->% rm -Rf .git/logs/

->% git gc --aggressive --prune=now

# git rev-parse

Is this directory part of a git repo?
->% git rev-parse --is-inside-work-tree
true






# END 

