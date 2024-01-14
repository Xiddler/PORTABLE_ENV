Opened
# set a shell
SHELL=/bin/bash

# tips

* Expands to all values for the field
, List separator
- Range separator
/ Specifies step for ranges

# Pro tip: 
Don't forget to end your cron files with an empty line or a comment, otherwise it will not work.

# crontab format
* * * * *  command_to_execute
- - - - -
| | | | |
| | | | +- day of week (0 - 7) (where sunday is 0 and 7)
| | | +--- month (1 - 12)
| | +----- day (1 - 31)
| +------- hour (0 - 23)
+--------- minute (0 - 59)

5th *
0 Sunday
1 Monday
2 Tuesday
3 Wednesday
4 Thursday
5 Friday
6 Saturday
7 Sunday

1st *   2nd *   3rd *   4th *   5th *
minute  hour    day     month   dayofweek


1   2   3   4   5
* 	* 	* 	* 	* 	[COMMAND]

1 (0-59) 	Minute
2 (0-23) 	Hour
3 (1-31) 	Day of the month
4 (1-12) 	Month
5 (0-6) 	Day of the week

eg
*/4 * * * * <command> will run <command> every 4 minutes

# @symbol

example
@reboot /usr/bin/python3 /home/donagh/Applications/flask_htmx_lanner/app.py

@hourly Run at the start of each hour
@daily Run every day at midnight UTC
@weekly Run at every Sunday at midnight UTC
@monthly Run on the 1st of each month at midnight UTC
@yearly Run on Jan 1st at midnight UTC
@annually Same as @yearly

# EXAMPLES
# every 15 min
*/15 * * * * /home/user/command.sh

# every hour
0 * * * * /home/donagh/.scripts/

# every midnight
0 0 * * * /home/user/command.sh

# every Saturday at 8:05 AM
5 8 * * 6 /home/user/command.sh

# borg backup schedule
0 16 * * * 

# Examples from https://cron.help/examples

Every Minute * * * * *
Every Five Minutes */5 * * * *
Every 10 Minutes */10 * * * *
Every 15 Minutes */15 * * * *
Every 30 Minutes */30 * * * *
Every Hour 0 * * * *
Every Two Hours 0 */2 * * *
Every Six Hours 0 */6 * * *
Every 12 Hours 0 */12 * * *
During the Work Day */5 9-17 * * *
Every day at Midnight 0 0 * * *
Every Two Weeks 0 0 * * Sun [ $(expr $(date +%W) % 2) -eq 1 ] && /path/to/command
At the Start of Every Month 0 0 1 * *
On January 1st at Midnight 0 0 1 1 *



# Notes



