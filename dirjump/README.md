Opened 2024-06-25


# dirjump

github https://github.com/imambungo/dirjump


# install

## Method 1
Download the script.

->%      curl --create-dirs -o ~/.config/dirjump/dirjump https://raw.githubusercontent.com/imambungo/dirjump/master/dirjump

Source the script to your shell. Don't forget to restart your terminal afterward.

 echo 'source ~/.config/dirjump/dirjump' >> ~/.bashrc

If you use Zsh:

 echo 'source ~/.config/dirjump/dirjump' >> ~/.zshrc



## UPDATE: 2024-06-25  Method 2

I have git-cloned the repository to /home/donagh/PORTABLE_ENV/dirjump/
so now just:
->% mkdir ~/.config/dirjump
->% ln -s ~/PORTABLE_ENV/dirjump/dirjump/dirjump ~/.config/dirjump/dirjump

then in ~/.zshrc
source ~/.config/dirjump/dirjump

# usage
You need to "populate" dirjump by cd'ing to various files and after a while you can do this:
->% d
and it will output most recent 10 dirs visited




