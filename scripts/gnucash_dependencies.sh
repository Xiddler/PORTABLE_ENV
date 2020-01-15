#!/bin/bash


sudo apt install libtool libltdl-dev
sudo apt install libglib2.0 libglib2.0-dev   #glib2 > v2.40.0
sudo apt install icu-devtools libicu-dev
sudo apt install libboost-all-dev            # boost > 1.50.0  - requires locale and regex built with ICU support
sudo apt install guile-2.0 guile-2.0-dev     # guile >=2.0.0
sudo apt install swig2.0                     # swig  >2.0.10  - swig3.0 on some systems
											 # not required if building from tarball,
											 # but required if building from a git clone
sudo apt install libxml2 libxml++2.6-dev libxml2-utils
sudo apt install libxslt1.1 libxslt1-dev
sudo apt install xsltproc
sudo apt install texinfo                     # required for makeinfo
sudo apt install libsecret-1-0

# Only use the next 2 lines if you have not installed  Google Test already.
sudo apt install libgtest-dev                # >=1.7.0
sudo apt install google-mock                 # 1.8.0 installs googlemock in a subdirectory of gtest

sudo apt install gtk+3.0
sudo apt install libgtk-3-dev
sudo apt install libwebkit2gtk-4.0-37 libwebkit2gtk-4.0-dev  # > webkit2gtk-3.0
