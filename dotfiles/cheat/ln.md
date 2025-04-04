# FRONTMATTER
Opened

# ->% ln            :: make a link; hard or symbolic (symlink)
# =============================================================================================================
# Notes

`ln` is “dumb” about how it handles the first argument.

If the first argument isn’t an absolute path, it must be relative to the second argument, and not to pwd.

    ln ./foo ./bar/baz

./bar/baz will be a symlink whose literal contents are `./foo` so it will look for foo in the same directory (bar), rather than in bar’s parent directory.

This is totally backwards from how other utilities behave. Which is completely understandable if you know what it’s doing under the hood. But it is counterintuitive and surprising.


This is what made the “ln” argument order click for me as well.

Another piece of this parallel is that (with cp and mv) you can omit naming the destination file - you often just name the directory:

  cp /other/dir/foo.txt .

The corresponding shortcut with ln is not naming the destination at all, and the symlink is created in the working directory:

  ln -s /other/dir/foo.txt

Both of the above are my most common usage patterns, and the abbreviation of the second argument in both helps reinforce the parallel between cp, mv and ln.



# =============================================================================================================
# FOOTNOTES

