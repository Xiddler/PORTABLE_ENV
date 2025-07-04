Opened 2024-01-09

# webrefs
https://github.com/zsh-users/zsh/blob/master/Functions/Misc/zcalc


# Notes
(Note: Taken from the above url)
Usage:
->% zcalc
1> <mathhere>

 Zsh calculator.  Understands most ordinary arithmetic expressions.

        Line editing and history are available. A blank line or `q' quits.

 Runs as a script or a function.  If used as a function, the history
 is remembered for reuse in a later call (and also currently in the
 shell's own history).  There are various problems using this as a
 script, so a function is recommended.

 The prompt shows a number for the current line.  The corresponding
 result can be referred to with $<line-no>, e.g.
   1> 32 + 10
   42
   2> $1 ** 2
   1764
 The set of remembered numbers is primed with anything given on the
 command line.  For example,
   zcalc '2 * 16'
   1> 32                     # printed by function
   2> $1 + 2                 # typed by user
   34
   3>
 Here, 32 is stored as $1.  This works in the obvious way for any
 number of arguments.

 If the mathfunc library is available, probably understands most system
 mathematical functions.  The left parenthesis must be adjacent to the
 end of the function name, to distinguish from shell parameters
 (translation: to prevent the maintainers from having to write proper
 lookahead parsing).  For example,
   1> sqrt(2)
   1.4142135623730951

        is right, but `sqrt (2)' will give you an error.

 You can do things with parameters like
   1> pi = 4.0 * atan(1)
 too.  These go into global parameters, so be careful.  You can declare
 local variables, however:
   1> local pi
 but note this can't appear on the same line as a calculation.  Don't
 use the variables listed in the `local' and `integer' lines below
 (translation: I can't be bothered to provide a sandbox).

 You can declare or delete math functions (implemented via zmathfuncdef):
   1> function cube $1 * $1 * $1
 This has a single compulsory argument.  Note the function takes care of
 the punctuation.  To delete the function, put nothing (at all) after
 the function name:
   1> function cube

 Some constants are already available: (case sensitive as always):
   PI     pi, i.e. 3.1415926545897931
   E      e, i.e. 2.7182818284590455

 You can also change the output base.
   1> [#16]
   1>

     Changes the default output to hexadecimal with numbers preceded by `16#'.

     Note the line isn't remembered.

   2> [##16]
   2>
 Change the default output base to hexadecimal with no prefix.
   3> [#]
 Reset the default output base.

 This is based on the builtin feature that you can change the output base
 of a given expression.  For example,
   1> [##16]  32 + 20 / 2
   2A
   2>
 prints the result of the calculation in hexadecimal.

 You can't change the default input base, but the shell allows any small
 integer as a base:
   1> 2#1111
   15
   2> [##13] 13#6 * 13#9
   42
 and the standard C-like notation with a leading 0x for hexadecimal is
 also understood.  However, leading 0 for octal is not understood --- it's
 too confusing in a calculator.  Use 8#777 etc.

     Options: -#<base> is the same as a line containing just `[#<base>],

 similarly -##<base>; they set the default output base, with and without
 a base discriminator in front, respectively.

 With the option -e, the arguments are evaluated as if entered
 interactively.  So, for example:
   zcalc -e -\#16 -e 1055
 prints
   0x41f
 Any number of expressions may be given and they are evaluated
 sequentially just as if read automatically.
