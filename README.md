# Test

This is a test to see if -> % git add -p allows me to stage this hunk / chunk Now 2022-01-22_18:12

# 2022-02-01
ln -s ~/PORTABLE_ENV/zim ~/.config/zim


# 2022-01-31
successfully set up my ssh but not able to avoid username/passphrase
dialog. How come?

# my dot_files

2020-12-19 - Added new SSH key Dec_2020 as the password method is being deprecated. Stored in /run/media/donaghm/01d4c077-4709-4b5b-9431-087bc9060d68/REPOSITORIES/2programming/ssh/ssh_keys_2020 
THEY USE personal access tokens INSTEAD OF PASSWORDS IN THE CLI

tried
git config --local core.sshCommand "/usr/bin/ssh -i run/media/donaghm/01d4c077-4709-4b5b-9431-087bc9060d68/REPOSITORIES/2programming/ssh/ssh_keys_2020/id_rsa_GH"

2020-03-05 - I added cheat folders to not lose my edited cheats - using rsync ~/.cheat/* ~/PORTABLE_ENV/cheat/dot_cheat to back them up 
2019-08-11 - made the PORTABLE_ENV directory in Github
2019-03-04 

2020-04-06
Added folder "droplets" to repo to make setting up website on Digital Ocean easier 

2020-04-01
To install oh-my-zsh
sudo curl -L http://install.ohmyz.sh | sh

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


### bookmarks
bookmarks.csv
These are exported from zotero in .csv format. And can be converted to other formats.


### vim plugins
$HOME/.vim/pack/<plugin>/start/{git clone here}
"=== Preferred Plugins === 
tpope
https://github.com/tpope/vim-surround.git  
https://github.com/tpope/vim-commentary.git  

francoiscabrol
https://github.com/francoiscabrol/ranger.vim.git
vim-ranger
p <leader>f :Ranger<CR>

theme
nightsense
https://github.com/nightsense/stellarized.git

airline
https://github.com/vim-airline/vim-airline.git

masukomi
mkdir -p $HOME/.vim/pack/masukomi/start && git clone https://github.com/masukomi/vim-markdown-folding
vim-markdown-folding

mattn
emmet-vim
https://github.com/mattn/emmet-vim.git

multicursor
ttps://github.com/terryma/vim-multiple-cursors
