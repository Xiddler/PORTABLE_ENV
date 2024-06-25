Opened 2021-11-06

# NOTES
Timezones, epochtime conversion etc.
See also zim-wiki TOOLS/

# Cities

Paris                    CET (Central European Time)     GMT/UTC+1
Moscow                   MSK (Moscow Time)               GMT/UTC+3
New York                 EST (Eastern Standard Time)     GMT/UTC-5
St. Louis, Misouri       CST (Central Standard Time)     GMT/UTC-6
Los Angeles              PST (Pacific Standard Time)     GMT/UTC-8
San Francisco            PST (Pacific Standard Time)     GMT/UTC-8
Christchurch             NZDT¹ (NZ Standard Time)        GMT/UTC+13 
Rio de Janeiro           BRST (Brasilia Summer Time)     GMT/UTC-3
Mumbai                   IST (India Standard Time)       GMT/UTC+5:30
Beijing                  CST (China Standard Time)       GMT/UTC+8

¹It is (Dec) summertime / daylight saving time in NZ hence NZDT - otherwise NZST GMT/UTC+12. See DST below.

## Examples
To get the current time in Paris, add 1 hour to GMT
If the time in Mumbai is 12:30, then my local time is 07:00



# Timezones

 CET (Central European Time)     GMT/UTC+1
 MSK (Moscow Time)               GMT/UTC+3
 EST (Eastern Standard Time)     GMT/UTC-5
 ET (Eastern Time)               GMT/UTC-5
 CST (Central Standard Time)     GMT/UTC-6
 PST (Pacific Standard Time)     GMT/UTC-8
 NZDT (NZ Daylight Time)         GMT/UTC+13
 BRST (Brasilia Summer Time)     GMT/UTC-3
 IST (India Standard Time)       GMT/UTC+5:30 
 CST (China Standard Time)       GMT/UTC+8

 Note: For cities to the east of London, add hours, otherwise subtract. 
 e.g. New York is west, therefore subtract (5) hours.

## Examples

chess.com 8am in Pacific Standard Time is 4pm in Dublin time i.e. add 8 hours to get my local time in Ireland --> 16:00
chess.com 11am ET is 16:00 GMT

## DST Daylight Saving Time 

daylight saving time is usually observed from late March to late October
Rem: Summer time is the inverse in the other hemisphere

## Full list of time zones - website 

https://24timezones.com/time-zones ; includes UTC offset and GMT offset -- handy 

## Examples

It is 11:53 now
The GMT offset is 0  it's 11:53 GMT - 
The BST offset is +1 it's 12:53 BST - this means that if you give me a time in BST I SUBTRACT 1 from it to get my local time 
The CET offset is +1 it's 12:53 CET - this means that if you give me a time in CET I SUBTRACT 1 from it to get my local time 
The PT offset is -7 / -8 it's 03:53 PT  - this means that if you give me a time in PT I ADD 8 to it to get my local time 
Note¹ (why -7 OR -8?) 

Note¹ 
Pacific Time Zone GMT/UTC offset
Pacific Standard Time is 8 hours behind Coordinated Universal Time (UTC).
Pacific Daylight Time is 7 hours behind UTC.


## If you give me:

CET? -1 hr
CET I need to subtract 1 hour to get my local time
GMT I need to add 1 hour to get CET

PT? +8 hrs
PT I need to add 8 hours to get my local time
GMT I need to subtract 8 hours to get PT 



# Epoch converter
(Note: 10 significant digits before the decimal point)

## Epoch --> Date

->% date -d @1682985600.000
Output
Tue 02 May 2023 01:00:00 IST 

alias -g epochtodate="date -d @"$1
epochtodate 1695641243

->% date -d @1682985600
Tue 02 May 2023 01:00:00 IST 

## Date --> Epoch

->% date -d '06/12/2012 07:21:22' +"%s"
1339482082

## For UTC

->% dat="$(date)"

->% echo $dat
Wed Dec 27 09:45:17 GMT 2023

->% date  -u -d $dat +"%s"
1703670317

## zsh module zsh/datetime ... strftime 

(First loadt the zsh/datetime module)
->% zmodload zsh/datetime
(Now, call the strftime function - a C function!)
->% $ strftime -r %Y%m%d%H%M%S 20191027163020
1572193820

## Custom format
->% date -d @1234567890 +'%Y-%m-%d %H:%M:%S'
2009-02-13 23:31:30




## Manual
<timestamp-epoch> / 86400

## Website
https://www.epochconverter.com/
eg 1636231543

# Cheat date

-> % vim ~/.cheat/date
-> % che date



# Unix time commands

## System clock
To see all relevant information about your system clock
-> % timedatectl

to set to local timezone
->% timedatectl set-timezone Europe/Dublin

## Hardware clock
The hardware clock will continue to keep time when the computer is powered off, thanks to the CMOS battery on the motherboard.
-> % sudo hwclock

## Unix time
The most common way to query the system time in Linux
-> % date

# python datetime

❯ bpython

>>> import datetime
>>> v = datetime.datetime.now(tz=datetime.UTC)
>>> v
datetime.datetime(2023, 12, 29, 13, 13, 45, 541385, tzinfo=datetime.timezone.utc)

# moreutils ts

->% echo ' ' | ts '%F %.T'
OUTPUT 
2024-01-01 13:00:32.863726


# python -m module calendar

USAGE:
->% python -m calendar <year> <month>

EXAMPLES:

❯ python -m calendar 1961 03
     March 1961
Mo Tu We Th Fr Sa Su
       1  2  3  4  5
 6  7  8  9 10 11 12
13 14 15 16 _17_ 18 19
20 21 22 23 24 25 26
27 28 29 30 31

❯ python -m calendar 1962 08
    August 1962
Mo Tu We Th Fr Sa Su
       1  2  3  4  5
 6  7  8  9 10 11 12
13 14 15 16 _17_ 18 19
20 21 22 23 24 25 26
27 28 29 30 31


# timedatectl

