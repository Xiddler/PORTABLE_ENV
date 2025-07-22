# FRONTMATTER
Opened 2025-07-05
Filepath 

# Special Parameters
# =============================================================================================================


# dollar params
See man bash --▷  special parameters 

$1, $2, $3, ... are the positional parameters.
"$@" is an array-like construct of all positional parameters, {$1, $2, $3 ...}.
"$*" is the IFS expansion of all positional parameters, $1 $2 $3 ....
$# is the number of positional parameters.
$- current options set for the shell.
$$ pid of the current shell (not subshell).
$_ most recent parameter (or the abs path of the command to start the current shell immediately after startup). Same as !$
$IFS is the (input) field separator.
$? is the most recent foreground pipeline exit status.
$! is the PID of the most recent background command.
$0 is the name of the shell or shell script.


# usage



To help understand what $#, $0 and $1, ..., $n do, I use this script:

#!/bin/bash

```
for ((i=0; i<=$#; i++)); do
  echo "parameter $i --> ${!i}"
done

Running it returns a representative output:

$ ./myparams.sh "hello" "how are you" "i am fine"
parameter 0 --> myparams.sh
parameter 1 --> hello
parameter 2 --> how are you
parameter 3 --> i am fine

```






# =============================================================================================================
# FOOTNOTES

