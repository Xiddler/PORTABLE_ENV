Opened 2022-02-07


## Notes
The file startup.py can store variable names that you can use in a python repl.


Quote:
I still use the python repl in a terminal for my desktop calculator. Its a good choice since usually im already in the terminal anyways.

I also do the same although when I need fractions, having to type all the words to import and use the fraction module is a pain

Why not just save those words, and other commonly used words to a startup file? Then, you can just do

    export PYTHONSTARTUP=/home/savant_penguin/.python/startup.py

and those things will be automatically loaded for you. If you don't want them always loaded, but rather just for a "calculator mode," you can do something like

    alias pycalc='PYTHONSTARTUP=/home/savant_penguin/.python/ipython startup_calc_mode.py'

If you use ipython, then you can take advantage of autocomplete and not have to type as much, too.


