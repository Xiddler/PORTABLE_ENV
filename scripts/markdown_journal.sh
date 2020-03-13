#!/bin/bash


# ----------------- START journal ------------------------------
# my easy journal 
# Set up the journal directory on the SD64 Card
# journal='/run/media/donagh/c60cbdfc-37a8-4e08-b2dd-6286d16beb3d/SD35-BACKUP/1donaghs-stuff/personal/journal'
#
md_journal() {
        local year=`date +%Y`
        local month=`date +%m`
        local today=`date +%Y-%m-%d`
        local myDir='/home/donagh/sd64/1donaghs-stuff/personal/journal/'$year/$month
        mkdir -p $myDir
        local filen=$myDir/`date +%d-%m`\.md
        if [ ! -f $filen ]; 
        then
            touch $filen
            # front matter for new day's journal:
            echo "$today

        ### Notes
        " >>  $filen
        $EDITOR +5 $filen
        else
           $EDITOR "+normal G$" +startinsert $filen 
        fi

}

md_journal
