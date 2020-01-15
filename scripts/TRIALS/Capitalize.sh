#!/bin/bash

string="abcd"
first=`echo $string|cut -c1|tr [a-z] [A-Z]`
second=`echo $string|cut -c2-`
echo $first$second
