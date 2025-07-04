Opened 2025-02-22


# help

## cheatsheet

URL: https://gist.github.com/AnimeshRy/5594830c91bbcf10ad886cfaca3472ad

### # install uv on OS
curl -LsSf https://astral.sh/uv/install.sh | sh

####  create new project
uv init myproj

### install packages
uv add django requests "pandas>=2.3"

### remove package
uv remove django

### see pkg dependency tree
uv tree

### run a python script directly w/o starting venv
uv run main.py

### install specific version of python
uv python list
uv python install 3.12

### start a new project and pin it to Python 3.12
uv init myproject
uv python pin 3.12
uv add django
uv run main.py (will automatically install py3.12 and django into venv)

### run a cli tool like Ruff
uv run tool ruff (or uvx ruff)

### update uv version to latest
uv self update

## uv help

An extremely fast Python package manager.

Use `uv help <command>` for more information on a specific command.

Usage: uv [OPTIONS] <COMMAND>

Commands:
  run                        Run a command or script
  init                       Create a new project
  add                        Add dependencies to the project
  remove                     Remove dependencies from the project
  sync                       Update the project's environment
  lock                       Update the project's lockfile
  export                     Export the project's lockfile to an alternate format
  tree                       Display the project's dependency tree
  tool                       Run and install commands provided by Python packages
  python                     Manage Python versions and installations
  pip                        Manage Python packages with a pip-compatible interface
  venv                       Create a virtual environment
  build                      Build Python packages into source distributions and wheels
  publish                    Upload distributions to an index
  cache                      Manage uv's cache
  self                       Manage the uv executable
  version                    Display uv's version
  generate-shell-completion  Generate shell completion
  help                       Display documentation for a command

Cache options:
  -n, --no-cache               Avoid reading from or writing to the cache, instead using a temporary directory for the duration of the operation [env:
                               UV_NO_CACHE=]
      --cache-dir <CACHE_DIR>  Path to the cache directory [env: UV_CACHE_DIR=]

Python options:
      --python-preference <PYTHON_PREFERENCE>  Whether to prefer uv-managed or system Python installations [env: UV_PYTHON_PREFERENCE=] [possible values:
                                               only-managed, managed, system, only-system]
      --no-python-downloads                    Disable automatic downloads of Python. [env: "UV_PYTHON_DOWNLOADS=never"]

Global options:
  -q, --quiet                                      Do not print any output
  -v, --verbose...                                 Use verbose output
      --color <COLOR_CHOICE>                       Control the use of color in output [possible values: auto, always, never]
      --native-tls                                 Whether to load TLS certificates from the platform's native certificate store [env: UV_NATIVE_TLS=]
      --offline                                    Disable network access [env: UV_OFFLINE=]
      --allow-insecure-host <ALLOW_INSECURE_HOST>  Allow insecure connections to a host [env: UV_INSECURE_HOST=]
      --no-progress                                Hide all progress outputs [env: UV_NO_PROGRESS=]
      --directory <DIRECTORY>                      Change to the given directory prior to running the command
      --project <PROJECT>                          Run the command within the given project directory
      --config-file <CONFIG_FILE>                  The path to a `uv.toml` file to use for configuration [env: UV_CONFIG_FILE=]
      --no-config                                  Avoid discovering configuration files (`pyproject.toml`, `uv.toml`) [env: UV_NO_CONFIG=]
  -h, --help                                       Display the concise help for this command
  -V, --version                                    Display the uv version




## uv init <options>
Some <options> are:

`--vcs none` 
       to explicitly avoid initializing a version control system
->% uv init --vcs none 

`--name <NAME>`
      The name of the project.
      Defaults to the name of the directory.

`--bare`
      Only create a `pyproject.toml`.
      Disables creating extra files like `README.md`, the `src/` tree, `.python-version` files, etc.


# simple workflow

uv python install [<version>]               if you want a particular version of python to be installed

uv init [--vcs none] [--python <version>]   in each directory to initialize the python project

uv add [--dev]                              to add libraries to your venv
_example_
->% uv add django requests "pandas>=2.3"    adds the following packages: django, requests and pandas, specifically the 2.3 version of it

uv run <cmd>                                when you want to run a command in the venv

That's it, really. Any bonus can be learned later.

## virtual environments

With uv init, some project state is not created until needed, e.g., the project virtual environment (`.venv`) and lockfile (`uv.lock`) are lazily created during the first sync. (I think this means after running `uv add ?` or `uv run ?` — need to confirm this)

### with uv

To deliberately create a venv use the following; this creates a venv in the current directory
->% uv venv

### create a new venv named myvenv in ~/.virtualenvs/
Note: This was my former way of doing it. uv recommends having the venv in the project file.

->% uv venv $HOME/.virtualenvs/myvenv 

## add packages


->% uv pip install <package>                :: legacy pip way to install a package using uv

->% uv add <package>                        :: uv method to add dependency (aka package)

### ->% uv help add 

(partial)
Usage: uv add [OPTIONS] <PACKAGES|--requirements <REQUIREMENTS>>

Arguments:
  [PACKAGES]...
          The packages to add, as PEP 508 requirements (e.g., `ruff==0.5.0`)

Options:
  -r, --requirements <REQUIREMENTS>
          Add all packages listed in the given `requirements.txt` files

# starting a new python project using uv

See zim-wiki --> Python:package_installers:uv:uv_projects:test_FH

> uv init

> uv lock

(The following automatically creates the .venv virtualenv folder)
> uv run main.py

> ls
## {{{ output ls

    Directory: C:\Users\don_l\python_stuff\FastHTML\test_FH

Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d----         Fri, 06-Jun    15:25                .venv
-a---         Fri, 06-Jun    15:20            109 .gitignore
-a---         Fri, 06-Jun    15:20              5 .python-version
-a---         Fri, 06-Jun    15:20             85 main.py
-a---         Fri, 06-Jun    15:20            153 pyproject.toml
-a---         Fri, 06-Jun    15:24            358 README.md
-a---         Fri, 06-Jun    15:25            127 uv.lock

## }}}


Then inside the project folder
> .venv\Scripts\activate
NOTE: this activated the virtualenv and automatically named it uv_sample_project — the same title as the project

*C:\Users\don_1\python_stuff\FastHTML\test_FH\.venv* ~\python_stuff\FastHTML\test_FH git:(master):6

The *emphasised* section highlights that the virtual env is activated and being used

To uv add <package>
> uv add python-fasthtml

OR

> uv pip install python-fasthtml
