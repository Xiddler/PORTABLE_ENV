# Help


See ~/.cheat/time.md for timezones and system time etc. and also ~/.cheat/timezones.md

# QUICKIES

->% echo  $(date +"%Y-%m-%d")

# date utility
->%  date --help
man date
https://www.epochconverter.com/
  see also
  dateutils - sudo pamac install dateutils. $ info dateutils for details. Can do anything with dates.
  today's date
->% echo  $(date +"%Y-%m-%d")
 2023-10-05

->% date

# convert epoch(Unix) time to human readable date; seconds since 1/1/1970 

date --date="@1669807759"
 alternative 

# Convert Unix timestamp to Date(Linux)

date -d @1440359821

date -ud @1700000000
-> Tue 14 Nov 2023 22:13:20 UTC

date -ud @1800000000
-> Fri 15 Jan 2027 08:00:00 UTC

date -ud @1900000000
-> Sun 17 Mar 2030 17:46:40 UTC

# Convert Unix timestamp to Date(Mac)
date -r 1440359821

# Convert 'now' to Unix timestamp 
date +"%s"

# Get day of week of date

->%  date --date '1962-08-17' | cut -d' ' -f1
Fri

# Print today's date in format suitable for affixing to file names
date +"%Y%m%d_%H%M%S"

 in a script
p=$(date +"%Y-%m-%d")
echo $p
 same as ...
P=$(date -I)
echo $P

# yesterday's date
date --date="yesterday"
date  --date="yesterday" +"%Y-%m-%d" # YYYY-mm-dd format

# 2 days ago 
date --date="2 days ago" 
> Tue 29 Nov 2022 11:58:59 GMT

# next Friday
date --date='next Friday'

# last day of next month  NOTE: -d = --date 
date -d 'next month - '`date +%d`'day'
> Sat 31 Dec 2022 12:04:18 GMT
OR
date --date "next month - $(date +%d) day"

# 3 months ago
date --date '3 months ago - '`date +%d`'day'
> Wed 31 Aug 2022 13:07:39 IST

# date of next 3 Tuesdays (today is Tuesday) at 3 week intervals
arrVar=("3" "6" "9")

for i in "${arrVar[@]}"; do
echo $(date --date="$i weeks");
done
>output<
Tue 12 Dec 2023 09:05:44 GMT
Tue 02 Jan 2024 09:05:44 GMT
Tue 23 Jan 2024 09:05:44 GMT


%FORMAT String 	Description
%% 	a literal %
%a 	locale’s abbreviated weekday name (e.g., Sun)
%A 	locale’s full weekday name (e.g., Sunday)
%b 	locale’s abbreviated month name (e.g., Jan)
%B 	locale’s full month name (e.g., January)
%c 	locale’s date and time (e.g., Thu Mar 3 23:05:25 2005)
%C 	century; like %Y, except omit last two digits (e.g., 21)
%d 	day of month (e.g, 01)
%D 	date; same as %m/%d/%y
%e 	day of month, space padded; same as %_d
%F 	full date; same as %Y-%m-%d
%g 	last two digits of year of ISO week number (see %G)
%G 	year of ISO week number (see %V); normally useful only with %V
%h 	same as %b
%H 	hour (00..23)
%I 	hour (01..12)
%j 	day of year (001..366)
%k 	hour ( 0..23)
%l 	hour ( 1..12)
%m 	month (01..12)
%M 	minute (00..59)
%n 	a newline
%N 	nanoseconds (000000000..999999999)
%p 	locale’s equivalent of either AM or PM; blank if not known
%P 	like %p, but lower case
%r 	locale’s 12-hour clock time (e.g., 11:11:04 PM)
%R 	24-hour hour and minute; same as %H:%M
%s 	seconds since 1970-01-01 00:00:00 UTC
%S 	second (00..60)
%t 	a tab
%T 	time; same as %H:%M:%S
%u 	day of week (1..7); 1 is Monday
%U 	week number of year, with Sunday as first day of week (00..53)
%V 	ISO week number, with Monday as first day of week (01..53)
%w 	day of week (0..6); 0 is Sunday
%W 	week number of year, with Monday as first day of week (00..53)
%x 	locale’s date representation (e.g., 12/31/99)
%X 	locale’s time representation (e.g., 23:13:48)
%y 	last two digits of year (00..99)
%Y 	year
%z 	+hhmm numeric timezone (e.g., -0400)
%:z 	+hh:mm numeric timezone (e.g., -04:00)
%::z 	+hh:mm:ss numeric time zone (e.g., -04:00:00)
%:::z 	numeric time zone with : to necessary precision (e.g., -04, +05:30)
%Z 	alphabetic time zone abbreviation (e.g., EDT) 

# from Hacker News 2024-04-13
    date -Is -ud 'today'    --> 2024-04-12T14:04:08+00:00
    date -Is -ud 'tomorrow' --> 2024-04-13T14:04:08+00:00
    date -Is -ud '2 day'    --> 2024-04-14T14:04:08+00:00
    date -Is -ud '9 week'   --> 2024-06-14T14:04:08+00:00
    date -Is -ud '1 month'  --> 2024-05-12T14:04:08+00:00
    date -Is -ud '2024-04-10T13:31:46+04:00'     --> 2024-04-10T09:31:46+00:00
    date -Is -ud 'Wed, 14 Feb 2024 23:16:09 GMT' --> 2024-02-14T23:16:09+00:00

And if you want Z format, you can use a custom format string:
    date -ud '1 month' +'%FT%TTZ' --> 2024-05-12T14:13:22TZ
date -Is -ud '1998-07-12'

# quick date insert using `date`

->% date --iso-8601
2025-05-18

