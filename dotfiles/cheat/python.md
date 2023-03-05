# Desc: Python is a high-level programming language.

# Basic example of server with python
Will start a Web Server in the current directory on port 8000
 go to http://127.0.0.1:8000

 Python v2.7

python -m SimpleHTTPServer
 Python 3
python -m http.server 8000

# SMTP-Server for debugging, messages will be discarded, and printed on stdout.

python -m smtpd -n -c DebuggingServer localhost:1025

# Server files that are accessible over the LAN to other devices

$ python -m http.server 8080  --directory  /home/donagh/DONAGHS/personal/journal/2022/10  --bind 0.0.0.0
 Serve 11SignUps.txt for access from the tablet etc.
python -m http.server 8088  --directory ~/DONAGHS/MY_ZIM/Computer --bind 0.0.0.0



# Pretty print a json to the CLI

python -mjson.tool file.json

# VIRTUALENV 
create a new virtualenv e.g. 'flask'
 python3.9 -m venv <path-to-venv>/venv
python3 -m venv $HOME/.virtualenvs/flask 

 to activate virtenv
source $HOME/.virtualenv/flask/bin/activate

 to deactivate virtenv 
deactivate

 update pip - e.g. in fastapi virtualenv
/home/donaghm/.virtualenvs/fastapi/bin/python -m pip install --upgrade pip

 update pip - specifically inside a .virtualenv
(venv)-> % python -m pip install --upgrade pip

 virtualenvwrapper
 provides a set of commands which makes working with virtual environments much more pleasant. It also places all your virtual environments in one place.
To install (make sure virtualenv is already installed):
$ pip install virtualenvwrapper
$ export WORKON_HOME=~/Envs
$ source /usr/local/bin/virtualenvwrapper.sh
(https://virtualenvwrapper.readthedocs.io/en/latest/install.html)

# use requirements file
pip install -r requirements.txt

# python header
see .vimrc
!/usr/bin/python3
 -*- coding: utf-8 -*-
# modern formatting
a = "donagh"
print(f"My name is {a}")
->% My name is donagh
 Format specifiers for types, padding, or aligning are specified after the colon character; for instance: f'{price:.3}'
# The final line

if __name__ == "__main__":
    run()

# WEBSITES
https://docs.python-guide.org/
https://zetcode.com/all/#python

Learn python
https://github.com/Asabeneh/30-Days-Of-Python

# When using VIM editor to edit PYTHON: ref. python spaces / tabs

:retab # fixes tabs / spaces
:set lcs+=space:· # shows a . for each space
:set list # displays the .
:set nolist # hides the .
plugin --> git clone https://github.com/Yggdroot/indentLine
For code indented with tabs I think there is no  to support it, because you can use :set list lcs=tab:\|\

# Note on libraries

"click is to argparse is the same as requests is to urllib"


# Print no newline after this output

print("\nAccessing the class attribute through an object:", end= " ")


# choice menu
choice = None
while choice != "0":
    print \
    ('''
    Critter Caretaker
    0 - Quit
    1 - Listen to your critter
    2 - Feed your critter
    3 - Play with your critter
   '''
choice = input("Choice: ")
print()

# find the user base binary directory

python -m site --user-base


# ALL FORMATTING METHODS
foo = 'foo'
bar = 'bar'

foobar1 = '%s%s' % (foo, bar) # It is OK
foobar2 = '{0}{1}'.format(foo, bar) # It is better
foobar3 = '{foo}{bar}'.format(foo=foo, bar=bar) # It is even better
foobar4 = f'{foo}{bar}' # It is best - termed f-strings

myl = [foobar1, foobar2, foobar3, foobar4]    
[print(x) for x in myl] --> 'foobar'

# UPDATE PIP
python -m pip install --upgrade pip setuptools wheel

# Webrefs


# REPL
-> % ptpython   
2023-03-04
