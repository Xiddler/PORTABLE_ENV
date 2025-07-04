# To download a single file
wget http://path.to.the/file

# To download a file and change its name
wget http://path.to.the/file -O newname

# To download a file into a directory
wget -P path/to/directory http://path.to.the/file

# To continue an aborted downloaded
wget -c http://path.to.the/file

# To download multiples files with multiple URLs
wget URL1 URL2

# To parse a file that contains a list of URLs to fetch each one
wget -i url_list.txt

# To mirror a whole page locally

wget -pk http://path.to.the/page.html

# To mirror a whole site locally (but -k is for single pages only according to the man page)

wget -mk http://site.tl/


# Download a whole website

A website can be copied using the following command:

wget --mirror
     --convert-links
     --adjust-extension
     --page-requisites
     --no-parent
     --wait=0.1
     --random-wait
     https://www.example.com/pages/

Of course, replace the example URL with the address of the website you wish to mirror. Running the command will create a new directory in your current working directory. That new directory will contain the copied website once the mirroring is complete.

# To download files according to a pattern
wget http://www.myserver.com/files-{1..15}.tar.bz2

# To download all the files in a directory with a specific extension if directory indexing is enabled
wget -r -l1 -A.extension http://myserver.com/directory

# Allows you to download just the headers of responses (-S --spider) and display them on Stdout (-O -).
wget -S --spider -O - http://google.com

# Change the User-Agent to 'User-Agent: toto'
wget -U 'toto' http://google.com

