# for use in INSTALLED Ubuntu

# symbolic links
# folders
ln -s /media/donagh/015C-2582/Donaghs_WORKSEARCH  $HOME/donaghs_worksearch
ln -s /media/donagh/3520-FD13 $HOME/sd35
ln -s /media/donagh/3520-FD13/2programming_repository $HOME/2programming_repository 
ln -s /media/donagh/3520-FD13/2programming_repository/python $HOME/pyython
ln -s /media/donagh/3520-FD13/compressed_utilities $HOME/compressed_utilities
ln -s /media/donagh/3520-FD13/2programming_repository/python/1python_projects/pelican-blog $HOME/pelican-blog 
ln -s /media/donagh/3520-FD13/zim $HOME/ziim
ln -s /media/donagh/3520-FD13/zim/Computer/LINUX/1Linux_Live_USB $HOME/1linux_live_usb 

# files
ln -s /media/donagh/3520-FD13/zim/computer/linux/1linux_live_usb/dot_files/common_passwords.csv $HOME/common_passwords.csv
ln -s /media/donagh/3520-FD13/0My_Folders/00Donaghs_ORG/14_Donaghs_CONTACTS/00_Main_Contacts.csv contacts.csv # 2018-11-16
# ln -s /media/donagh/3520-FD13/2programming_repository/Ubuntu_resources $HOME/config_folder

# sh files
# .sh files won't run from the SDCard so they are copied to the laptop filesystem
cp /media/donagh/3520-FD13/zim/Computer/Linux/1Linux_Live_USB/dot_files/get_password.sh $HOME/get_password.sh 
cp /media/donagh/3520-FD13/zim/Computer/Linux/1Linux_Live_USB/dot_files/info.sh $HOME/info.sh
cp /media/donagh/3520-FD13/zim/Computer/Linux/1Linux_Live_USB/dot_files/contact_out.sh $HOME/contact_out.sh 
# cp /media/donagh/3520-FD13/2programming_repository/Ubuntu_resources/configuration_Ubuntu_1804.sh $HOME/config.sh
# chmod +x $HOME/get_password.sh $HOME/info.sh $HOME/contact_out.sh  $HOME/config.sh


# remove pre-installed .bashrc
rm ~/.bashrc 


# link my dot files to $HOME
# ln -s /media/donagh/3520-FD13/zim/Computer/Linux//1Linux_Live_USB/dot_files/dot_files/spacemacs ~/.spacemacs
ln -s /media/donagh/3520-FD13/zim/Computer/Linux/1Linux_Live_USB/dot_files/dot_files/bashrc ~/.bashrc 
ln -s /media/donagh/3520-FD13/zim/Computer/Linux/1Linux_Live_USB/dot_files/dot_files/init.vim ~/.config/nvim/init.vim # neovim
ln -s /media/donagh/3520-FD13/zim/Computer/Linux/1Linux_Live_USB/dot_files/dot_files/tmux.conf ~/.tmux.conf
ln -s /media/donagh/3520-FD13/zim/Computer/Linux/1Linux_Live_USB/dot_files/dot_files/vimrc ~/.vimrc


# Install Dependencies
# sudo add-apt-repository universe 
# sudo add-apt-repository "deb http://archive.canonical.com/ubuntu $(lsb_release -sc) partner" 


#copyq
# using clipit instead
# sudo apt install -y software-properties-common
# sudo add-apt-repository ppa:hluk/copyq

sudo apt-get update

# install my favourite apps
sudo apt install -y apcalc
sudo apt install -y autokey-common
sudo apt install -y autokey-gtk
sudo apt install -y clipit
# sudo apt install -y copyq
sudo apt install -y curl
sudo apt install -y git
# sudo apt install -y gnome-tweak-tool
sudo apt install -y fonts-powerline
sudo apt install -y gpick
sudo apt install -y htop
sudo apt install -y mplayer # for internet radio on firefox 
sudo apt install -y ncdu
sudo apt install -y powerline
sudo apt install -y python-pip
sudo apt install -y python3-pip
sudo apt install -y python3-venv
sudo apt install -y ranger
sudo apt install -y rename
sudo apt install -y scrot # used by zim
sudo apt install -y silversearcher-ag
# sudo apt install -y synapse # launcher
# sudo apt install -y synaptic
sudo apt install -y tmux
sudo apt install -y tree
sudo apt install -y vim-gtk3
# sudo apt install -y gnome-shell-extension-workspaces-to-dock # Workspaces / Activities
sudo apt install -y zim
sudo apt install -y zsh	

# install ohmyzsh to $HOME folder
sudo curl -L http://install.ohmyz.sh | sh
rm $HOME/.zshrc
ln -s /media/donagh/3520-FD13/zim/Computer/Linux/1Linux_Live_USB/dot_files/dot_files/zshrc ~/.zshrc

# Duplicati
# mkdir $HOME/Applications/duplicati
# cp /media/donagh/3520-FD13/compressed_utilities/duplicati/duplicati_2.0.3.3-1_all.deb $HOME/Applications/duplicati
# sudo dpkg -i duplicati_2.0.3.3-1_all.deb
# sudo apt-get -y -f install

# install from compressed_utilities
# xidel - CLI tool for xpath
# sudo dpkg -i /media/donagh/3520-FD13/compressed_utilities/xidel_xpath_tool/xidel_0.9.8-1_amd64.deb
# fd - fast replacement for find
# sudo dpkg -i ~/sd35/compressed_utilities/fd_find_alternative_on_CLI/fd-musl_7.1.0_amd64.deb

# python pip
sudo pip install --upgrade pip
sudo pip install cheat	

# python virtualenvs
python3 -m venv $HOME/.virtualenvs/basic
python3 -m venv $HOME/.virtualenvs/flask
python3 -m venv $HOME/.virtualenvs/django

# Spacemacs
# git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d


# Sublime Text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-add-repository "deb https://download.sublimetext.com/ apt/stable/"
sudo apt install -y sublime-text

# Make Applications folder for exa, XnView
mkdir $HOME/Applications

# exa -- advanced ls
cp /media/donagh/3520-FD13/compressed_utilities/exa_for_ls/exa-linux-x86_64-0.8.0.zip $HOME/Applications
cd $HOME/Applications && unzip exa-linux-x86_64-0.8.0.zip

# XnView
cp ~/sd35/compressed_utilities/XnView/XnViewMP-linux-x64.deb $HOME/Applications
sudo dpkg -i XnViewMP-linux-x64.deb

# zim 
sudo apt-get install -y libcanberra-gtk-module 
sudo apt-get install -y python-gtksourceview2

# start autokey to create $HOME/.configure/autokey/data/ folder
# autokey
# the following allows direct editing of the file which will persist
# ln -s  /media/donagh/3520-FD13/2programming_repository/autokey/autokey ~/.config/autokey/data/donaghs

# vim plugin manager --  install pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle 
# issue with pathogen wq
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# pathogen install plugins for vim
cd ~/.vim/bundle 
git clone  https://github.com/nightsense/stellarized                    # my favourite theme
git clone https://github.com/tpope/vim-commentary                       # e.g. gcl will comment out current line. gc [l, 3j, 0, $, G]
git clone https://github.com/tpope/vim-surround
git clone https://github.com/vim-airline/vim-airline                    # powerline statusline for vim
git clone https://github.com/mattn/emmet-vim.git                        # c-y, e.g. ! then c-y, for HTML boilerplate
git clone git://github.com/justinmk/vim-sneak.git                       # use s in normal mode to search for digraphs e.g. ba 
git clone git://github.com/nathanaelkane/vim-indent-guides.git          # <leader>ig -- helps visualize tabs / spaces
git clone https://github.com/francoiscabrol/ranger.vim.git				# ranger file explorer inside vim
git clone https://github.com/kshenoy/vim-signature.git                  # show and nav marks. Tips mA, m<space>, :help signature
cd $HOME

# git init
git config --global user.email "donagh99@eircom.net" &&  git config --global user.name "Xiddler"

# tkinter for my passin password enter GUI app
sudo apt install python3.6-tk

