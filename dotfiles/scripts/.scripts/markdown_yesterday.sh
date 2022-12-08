#!/bin/env bash
#


# ----------------- START journal ------------------------------
# open yesterdays journal 
# shortcut is -> % yj
# Set up the journal directory on the SD64 Card 
# journal='/run/media/donagh/c60cbdfc-37a8-4e08-b2dd-6286d16beb3d/SD35-BACKUP/1donaghs-stuff/personal/journal'
#
# yesterday's journal is given by date  --date="yesterday" +"%d-%m" .md 

md_yesterday() {
        local year=`date +%Y`
        local month=`date +%m`
        local yester=`date --date="yesterday" +%m/%d-%m`
        local myDir='/run/media/donagh/01d4c077-4709-4b5b-9431-087bc9060d68/DONAGHS/personal/journal/'$year
        local filen=$myDir/$yester.md
        vim $filen
}

md_yesterday
