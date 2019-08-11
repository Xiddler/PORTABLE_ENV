# my dot_files
2019-08-11 - made the PORTABLE_ENV directory in Github
2019-03-04 

## TO DO
make a script to copy these dot files to the new home folder with a leading dot





## These are my main dot_files. 
The initial dot is removed to keep them visible on my local machine.
I have also included my .vim folder for ultimate portability.
Made a symbolic link to ~/PORTABLE_ENV
/media/<myname>/3520-FD13/2programming_repository/git_github/dot_files/

This repo contains the following dot files and the .vim/ folder
The originals are saved in: 2programming_repository/git_github/dot_files/
The leading . is omitted for clarity (but retained in the folders)

## Meta files
README.md\
cp_to_P_E.sh

## Listing of the dot files
bashrc\
vimrc\
zshrc\
dircolors\
Xdefaults\
Xresources\
init.vim\
spacemacs\
tmux.conf\

and the following folder which has the vim plugins I like:
vim/


## .oh-my-zsh
$ sudo curl -L http://install.ohmyz.sh | sh\
but replace the .zshrc with the above one

## git
** get the dot files onto the remote machine **\
git clone https://github/Xiddler/dot_files.git\
git config --global user.email "xiddler@gmail.com" &&   git config --global user.name "Donagh"

## ssh
ssh-keygen -t rsa -b 4096 -C "xiddler@gmail.com"\
then
eval "$(ssh-agent -s)"\
ssh-add ~/.ssh/id_rsa\
cat $HOME/.ssh/id_rsa.pub | clipit\
(clipit is a clipboard manager -- a way to paste the key into github.com)

### add SSH key to github
go to github.com and paste the above id_rsa.pub into the SSH new key textbox
### to test
ssh -T -p 443 git@ssh.github.com

### powerline
sudo apt install powerline\
sudo apt install fonts-powerline



