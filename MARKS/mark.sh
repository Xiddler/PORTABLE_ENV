#!/bin/bash

# ref item on HN April 2021

# export CDPATH=.:~/.marks/

# function mark {
  # ln -sr "$(pwd)" ~/.marks/"$1"
# }

# mark @name      # create a bookmark
# cd @name        # jump to bookmark
# cd @<tab>       # list bookmarks
# cd @n<tab>      # auto-complete
# cd @name/<tab>  # can access sub-directories within bookmarks
# export MARKPATH=$HOME/.marks
export MARKPATH=$HOME/PORTABLE_ENV/MARKS/marks

mark() {
  mkdir -p "$MARKPATH"; ln -s "$(pwd)" "$MARKPATH/$1"
}

unmark() {
  rm -i "$MARKPATH/$1"
}

marks() {
  ls -l "$MARKPATH" | sed 's/  / /g' | cut -d' ' -f9- | sed 's/ -/\t-/g' && echo
}

jump() {
  cd -P "$MARKPATH/$1" 2>/dev/null || echo "No such mark: $1"
}
