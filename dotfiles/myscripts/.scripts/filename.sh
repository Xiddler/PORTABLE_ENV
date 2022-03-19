#!/bin/bash

# copy the filepath to the clipboard using readlink

readlink -f $1 | xclip

