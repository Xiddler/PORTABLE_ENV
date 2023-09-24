#!/usr/sbin/env python3 
# -*- coding: utf-8 -*-

# A python script to get the hash of a file from Julia Evans

# The following git command does the same
# git hash-object <path>

import hashlib
import sys

if not sys.warnoptions:
    import warnings
    warnings.simplefilter("default")



def object_path(content):
    header = f"blob {len(content)}\0"
    data = header.encode() + content
    digest = hashlib.sha1(data).hexdigest()
    return f".git/objects/{digest[:2]}/{digest[2:]}"


with open(sys.argv[1], "rb") as f:
    print(object_path(f.read()))


