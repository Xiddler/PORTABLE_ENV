Opened 2021-11-06


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
 CST (Central Standard Time)     GMT/UTC-6
 PST (Pacific Standard Time)     GMT/UTC-8
 NZDT (NZ Daylight Time)         GMT/UTC+13
 BRST (Brasilia Summer Time)     GMT/UTC-3
 IST (India Standard Time)       GMT/UTC+5:30 
 CST (China Standard Time)       GMT/UTC+8

 Note: For cities to the east of London, add hours, otherwise subtract. e.g. New York is west, therefore subtract (5) hours.

## Examples

chess.com 8am in Pacific Standard Time is 4pm in Dublin time i.e. add 8 hours to get my local time in Ireland --> 16:00

# DST Daylight Saving Time 

daylight saving time is usually observed from late March to late October
Rem: Summer time is the inverse in the other hemisphere

# Full list of time zones 
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


# If you give me:

CET? -1 hr
CET I need to subtract 1 hour to get my local time
GMT I need to add 1 hour to get CET

PT? +8 hrs
PT I need to add 8 hours to get my local time
GMT I need to subtract 8 hours to get PT 



# Epoch converter

# Manual
<timestamp-epoch> / 86400

## Website
https://www.epochconverter.com/
eg 1636231543

## Cheat date

-> % vim ~/.cheat/date
-> % che date  


## Commands

To see all relevant information about your system clock
-> % timedatectl

The hardware clock will continue to keep time when the computer is powered off, thanks to the CMOS battery on the motherboard.
-> % sudo hwclock

The most common way to query the system time in Linux
-> % date

