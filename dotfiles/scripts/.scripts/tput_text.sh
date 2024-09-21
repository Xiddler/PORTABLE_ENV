#!/usr/sbin/env bash 

set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR

# script here

# maybe add cleanup function
# trap cleanup EXIT # no matter how the program exits, run that cleanup function.




# tput_characters - Test various character attributes
# from:
# https://www.linuxcommand.org/lc3_adv_tput.php



    clear



    echo "tput character test"

    echo "==================="

    echo



    tput bold;  echo "This text has the bold attribute.";     tput sgr0



    tput smul;  echo "This text is underlined (smul).";       tput rmul



    # Most terminal emulators do not support blinking text (though xterm

    # does) because blinking text is considered to be in bad taste ;-)

    tput blink; echo "This text is blinking (blink).";        tput sgr0



    tput rev;   echo "This text has the reverse attribute";   tput sgr0



    # Standout mode is reverse on many terminals, bold on others. 

    tput smso;  echo "This text is in standout mode (smso)."; tput rmso



    tput sgr0

    echo
