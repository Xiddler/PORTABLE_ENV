#!/bin/env bash



# tar -czf /home/donaghm/REPOS/TESTING/dot_files.tar.gz /home/donaghm/REPOS/TESTING/dot_files/
# DONAGHS='/run/media/donagh/01d4c077-4709-4b5b-9431-087bc9060d68/DONAGHS/'
REPOS='/run/media/donagh/01d4c077-4709-4b5b-9431-087bc9060d68/REPOSITORIES/'

# now=$("/usr/sbin/date +%Y-%m-%d_%H:%M:%S")
now=$(date "+%Y_%m_%d")


# tar -czf /home/donagh/BACKUPS/TARGZ/DONAGHS/DONAGHS_$now.tar.gz $DONAGHS
tar -czf /home/donagh/BACKUPS/TARGZ/REPOS/REPOS_$now.tar.gz $REPOS


