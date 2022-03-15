#!/bin/env bash

# see also: ~/SD64/Jan_2022_full_manjaro_reinstall.md

# This shows how to install or start everyting after a shutdown.

# (Do I need to start a separate shell for some of these? How do I start a new shell in yakuake in a script?)

# Items

# copyq                 :: Applications menu
# autokey               :: Applications menu ___________________________________________________   Alt-A
# flameshot             :: Applications menu
# thunderbird           :: Applications menu ___________________________________________________   Alt-T
# Sticky Note           :: Applications menu

# Signal                :: Move to VirtDesktop6 and click on Signal icon _______________________   Alt-S
# zim                   :: Move to VirtDesktop2 and click on zim icon (ensure SD64 mounted) ____   Alt-Z
# qalc                  :: _____________________________________________________________________   Alt-Q
# Obsidian              :: _____________________________________________________________________   Alt-J

# from script
# cifs_share            :: script run in yakuake                     ::: requires password
# dropbox               :: script run in yakuake                     ::: requires password
# doom_emacs            :: script run in yakuake _______________________________________________   Alt-D                    

# tracker.ods           :: Shortcut Alt-L (custom shortcut if jumpapp functioning) _____________   Alt-L        <-- LibreOffice

# Firefox               :: _____________________________________________________________________   Alt-B        <-- Browser 
# Okular                :: _____________________________________________________________________   Alt-0
# Chromium              :: _____________________________________________________________________   Alt-C
# FBreader              :: _____________________________________________________________________   Alt-F
# VSCode                :: _____________________________________________________________________   Alt-V
# Konsole               :: _____________________________________________________________________   Alt-K        <-- Terminal

sudo pamac install  network-manager-applet 
-> % nm-applet          :: shows that internet is connected and number of 'bars'

Available letters Alt- : 
N X E G H I J O P Q R U W Y

