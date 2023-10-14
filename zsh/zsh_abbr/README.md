Opened 2023-10-10

/home/donagh/PORTABLE_ENV/zsh/zsh_abbr/README.md


# Notes


https://zsh-abbr.olets.dev/installation.html



zsh-abbr is the zsh manager for auto-expanding abbreviations - text that when written in a terminal is replaced with other (typically longer) text. Inspired by fish shell.

For example, abbreviate git checkout as co (or even c or anything else). Type coSpace and the co turns into git checkout. Abbreviate git checkout main as cm. Type cmEnter and the cm turns into and runs git checkout main. Don't want an abbreviation to expand? Use CtrlSpace instead of Space, and ;Enter instead of Enter.

Why? Like aliases, abbreviations save keystrokes. Unlike aliases, abbreviations can leave you with a transparently understandable command
history ready for using on a different computer or sharing with a colleague. And where aliases can let you forget the full command,
abbreviations may help you learn the full command even as you type the shortened version.

INSTALL

cd /home/donagh/PORTABLE_ENV/zsh/zsh_abbr/
then
git clone https://github.com/olets/zsh-abbr --single-branch --branch main --depth 1
