#!/usr/sbin/env bash 

set -euo pipefail
trap "echo 'error: Script failed: see failed command above'" ERR

# DST daylight saving time is being observed (from late March to late October) 

# NOTES
# Full list of time zones at -- https://24timezones.com/time-zones ; includes UTC offset and GMT offset -- handy 
# It is 11:53 now
# The GMT offset is 0  it's 11:53 GMT - 
# The BST offset is +1 it's 12:53 BST - this means that if you give me a time in BST I SUBTRACT 1 from it to get my local time 
# The CET offset is +1 it's 12:53 CET - this means that if you give me a time in CET I SUBTRACT 1 from it to get my local time 
# The PT offset is -7 / -8 it's 03:53 PT  - this means that if you give me a time in PT I ADD 8 to it to get my local time Note¹ (why -7 OR -8?) 

If you give me:
CET? -1 hr
CET I need to subtract 1 hour to get my local time
GMT I need to add 1 hour to get CET

PT? +8 hrs
PT I need to add 8 hours to get my local time
GMT I need to subtract 8 hours to get PT 


Note¹ 
# Pacific Time Zone GMT/UTC offset
# Pacific Standard Time is 8 hours behind Coordinated Universal Time (UTC).
# Pacific Daylight Time is 7 hours behind UTC.
#
# Outline of the program 

# Program to show local time for CET, PT and others.
# 1. Select acronym for the timezone from list you want to convert FROM 
# 1. PT - Pacific Time
# 2. CET - Central European Time
# 3. UTC - Coordinated Universal Time
# 4. GMT - Greenwich Mean Time 
# 5. BST - Britis Summer Time
# CITIES
# 6. Paris 
# 7. Moscow 
# 8. New York
# 9. St. Louis, Mississippi
# 10. Los Angeles
# 11. San Francisco  
# 12. Christchurch  
# 13. Rio de Janeiro 
#
# 2. Select acronym for the timezone from list you want to convert TO
# 1. PT - Pacific Time
# 2. CET - Central European Time
# 3. UTC - Coordinated Universal Time
# 4. GMT - Greenwich Mean Time 
# 5. BST - Britis Summer Time
#


