# Flags

-x extract
-c create
-f file
-t list tar
-z use gzip
-j use bz2
-v verbose
-C specify destination directory

# To extract an uncompressed archive:
tar -xvf /path/to/foo.tar

# To list contents of a tar file
->% tar -tf myarchive.tar
Output
<file1>
<file2>
<file3>
<file4>

# To create an uncompressed archive:
tar -cvf /path/to/foo.tar /path/to/foo/

# To extract a .gz archive:
tar -xzvf /path/to/foo.tgz

# To create a .gz archive:
tar -czvf /path/to/foo.tgz /path/to/foo/

# To list the content of an .gz archive:
tar -ztvf /path/to/foo.tgz

# To extract a .bz2 archive:
tar -xjvf /path/to/foo.tgz

# To create a .bz2 archive:
tar -cjvf /path/to/foo.tgz /path/to/foo/

# To extract a .tar in specified Directory:
tar -xvf /path/to/foo.tar -C /path/to/destination/

# To list the content of an .bz2 archive:
tar -jtvf /path/to/foo.tgz

# To create a .gz archive and exclude all jpg,gif,... from the tgz
tar czvf /path/to/foo.tgz --exclude=\*.{jpg,gif,png,wmv,flv,tar.gz,zip} /path/to/foo/

# To use parallel (multi-threaded) implementation of compression algorithms:
tar -z ... -> tar -Ipigz ...
tar -j ... -> tar -Ipbzip2 ...
tar -J ... -> tar -Ipixz ...


# Run the below command in the terminal to see the contents of a tar.gz file without extracting it:
 to list contents of tar file called file.tar:
$ tar -tvf file.tar


