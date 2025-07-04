
# What is 'make'?
Because the gcc command line can be long, frequently the make utility is used to simplify compiling C programs and for cleaning up files created by gcc.


# tutorial at
https://www.cs.swarthmore.edu/~newhall/unixhelp/howto_makefiles.html



# configure
./configure

tells you whether are quite ready to build the application. It will check if you have everything needed to build the application, and, if it sees any critical errors it will inform you.

# make

builds (compiles) the source code. Compiler compiles the code, but, most of the times, the code cannot stand alone, it requires external libraries (usually provided by ubuntu packages) to be installed. After this step the executable(s) of this specific application you are trying to install will be created.

# make install
sudo make install

moves all the needed for the application files to the appropriate system directories. This has to be done after make because the executables of the application have been created and can be moved to the appropriate system directory (e.g. /usr/bin/) for later use.

Libraries are necessary, because they allow a programmer to use code made by other people to achieve certain things. i.e. if I wanted to do some disk formatting in my program, I could use the libs someone already wrote to do the formatting, and I just have to make my program call those libraries. If that person finds an issue in their library, they can fix it, and it will fix it in my program too. This is how open-source software can be written so fast and be so stable.

