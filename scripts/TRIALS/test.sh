#!/bin/bash

word="puce"
string=$word
first=`echo $string|cut -c1|tr [a-z] [A-Z]`
second=`echo $string|cut -c2-`
echo $first$second


g=$word
echo "${g:0:1}" | tr '[:lower:]' '[:upper:]'
