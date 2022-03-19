#!/bin/bash

# tar -czf /home/donaghm/REPOS/TESTING/dot_files.tar.gz /home/donaghm/REPOS/TESTING/dot_files/

# echo "test backup completed"
# echo "dot_files directory backed up to TESTING/dot_files.tar.gz"


# now=$("/usr/sbin/date +%Y-%m-%d_%H:%M:%S")
now=$(date "+%Y-%m-%d_%H:%M:%S")

# exec /usr/sbin/touch "/tmp/file_$now"
/usr/sbin/touch "/tmp/file_$now"
# /usr/sbin/touch "/tmp/file_123"
# exec /usr/sbin/touch "/tmp/file_$now"
