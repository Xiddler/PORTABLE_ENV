Opened 2024-09-13
ref zim-wiki --▷ LINUX:1Linux Live USB:01installed apps:tmuxp


# Notes

mydaily6tabsessions.yaml is the hand-written yaml config file

my-6-daily-tabs.yaml is the version created using:
->% tmux freeze 


The main advantage of a tmux session manager like tmuxp is that if I (accidentally) delete a tab I don't have to 
go to all the rounds to recreate my preferred  6-tab set up. $HOME/.tmuxp/mydaily6tabsession.yaml will do that after I restart the
terminal

The other advantage is that the tabs come up in the _same order_ (or I can recall them in the same order) 
using this command:

->% tmuxp load $HOME/.tmuxp/mydaily6tabsession.yaml 

