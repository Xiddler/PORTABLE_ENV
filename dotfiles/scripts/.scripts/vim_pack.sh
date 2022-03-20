#!/bin/bash

# read repo_author
echo -n " Enter the repo : "
read repo
#get the owner of the git repo (https only in this case)
author=$(echo $repo | awk -F '/' '{ print $4 }')

mkdir -p $HOME/.vim/pack/$author/start

cd $HOME/.vim/pack/$author/start


echo $PWD




