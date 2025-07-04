# FRONTMATTER
Opened 2025-06-18


# shell redirection
# =============================================================================================================



File descriptor 0 is the standard input (stdin).
File descriptor 1 is the standard output (stdout).
File descriptor 2 is the standard error (stderr).

    0 is stdin
    1 is stdout
    2 is stderr


The symbol `>` means redirect
The symbol `&` indicates that what follows and precedes is a file descriptor, and not a filename. `&` is only interpreted to mean "file descriptor" in the context of redirections

## To redirect stdout to file.txt:

echo test > file.txt

This is equivalent to:

echo test 1> file.txt

## To redirect stderr to file.txt:

echo test 2> file.txt

So >& is the syntax to redirect a stream to another file descriptor:

    0 is stdin
    1 is stdout
    2 is stderr

## To redirect stdout to stderr:

echo test 1>&2   # equivalently, echo test >&2

## To redirect stderr to stdout:

echo test 2>&1

Thus, in 2>&1:

    2> redirects stderr to an (unspecified) file.
    &1 redirects stderr to stdout.







## To redirect stdout AND stderr to file.txt:

yourcommand &> filename

$ echo test &> file.txt

This redirects both standard output and standard error to file filename. (But is not POSIX-compliant).

some_command >file.log 2>&1

$ echo test > file.txt 2>&1

Try it!  With a file named `test.txt` containing "The quick brown fox jumps over the lazy dog"

->% cat test.txt > 01file 2>&1
->% cat 01file
"The quick brown fox jumps over the lazy dog"

(Note the extension here is .tzt with a `z` )
->% cat test.tzt > 01file 2>&1
->% cat 01file 
cat: test.tzt: No such file or directory ◁-- here stderr is redirected to the file 01file




# =============================================================================================================
# FOOTNOTES

