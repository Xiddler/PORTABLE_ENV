Opened 2025-02-22


# uv usage - Feb 2025

BASIC START

Create a new Python project using the `uv init` command:


->% uv init hello-world                                                 `<-- creates a new directory hello-world` contiaining hello.py

->%  cd hello-world

Virtualenv automatically created when you `uv run hello.py` or `uv run main.py`

->% uv run hello.py

_output_
Using CPython 3.9.21
Creating virtual environment at: .venv                                  `<-- created a new virtualenv in <project-dir>/.venv`
Hello from test-python-cuda!
## _________________________________________________________________

## Virtualenv methods

1. To run a command in the project environment, use 
`->% uv run <command>`

2. Create a .venv directory in your project folder, containing an isolated Python environment.
`->%  uv venv`

3. Activate the virtual environment

`->% source ./.venv/bin/activate`

This will activate the virtualenv and name it `<project-dir>` but all in lower case

## Install dependencies
For project dependencies, use uv add to add a package to the environment. 

->% uv add <package> 

## Check which version of python is being used

Example: inside the test_torch_uv directory:

PS> uv python --version
_output_
Application     python.exe                                         3.11.5150… C:\Users\don_l\Documents\PROGRAMMING\Pyt…

ie 
C:\Users\don_l\Documents\PROGRAMMING\Python\test_torch_uv\.venv\Scripts\python.exe




## Specify a python version for a venv
example
->% uv venv --python 3.11

### Managing Python Versions

UV can manage multiple Python versions seamlessly. To install a specific version:
PS>  uv python install 3.10

To switch between versions:
PS> uv python use 3.10

## Install latest Python version

PS> uv python install 

NOTE: uv installs python versions from 
https://github.com/astral-sh/python-build-standalone

## Install a specific Python version
## Windows uv example
Location: C:\Users\don_l\Documents\PROGRAMMING\Python\test_torch_uv
Venv: .\.venv

(test_torch_uv)
╭─    🏠   test_torch_uv  master ≢  ?6                                               | RAM: 5/5GB ⏰  12:23:03 

╰─ uv python --version
_output_
uv-python 0.6.2 (6d3614eec 2025-02-19)

## Deactivating and Removing Environments

Deactivate the virtual environment:
PS> uv deactivate

Remove the virtual environment:
PS> uv remove

## To lock dependencies declared in a pyproject.toml:

PS> uv pip compile pyproject.toml -o requirements.txt

Note by default the uv pip compile output is just displayed and --output-file / -o argument is needed to write to a file.

To lock dependencies declared in a requirements.in:
PS>  uv pip compile requirements.in -o requirements.txt

## _________________________________________________________________
## OLDER 

To create a new venv named myvenv in $HOME/.virtualenvs (but this location is deprecated for uv; editors will look in the project.toml dir).

->% uv venv $HOME/.virtualenvs/myvenv 

->% uv venv $HOME/.virtualenvs/torch




To install a package

->% uv pip install torch

