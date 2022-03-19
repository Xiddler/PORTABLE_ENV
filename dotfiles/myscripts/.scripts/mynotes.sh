#!/bin/bash


# ----------------- START journal ------------------------------
# my easy notes 
# Set up the notes directory on the SD64 Card
# notes='/run/media/donagh/c60cbdfc-37a8-4e08-b2dd-6286d16beb3d/SD35-BACKUP/1donaghs-stuff/personal/notes'
#
md_notes() {
        local year=`date +%Y`
        local month=`date +%m`
        local today=`date +%Y-%m-%d`
        local myDir='/home/donagh/sd64/1donaghs-stuff/personal/notes/'$year/$month
        mkdir -p $myDir
        local filen=$myDir/`date +%d-%m`\.md
        if [ ! -f $filen ]; 
        then
            touch $filen
            # front matter for new day's notes:
            echo "$today

### Notes
" >>  $filen
        $EDITOR +5 $filen
        else
           $EDITOR "+normal Go" $filen 
        fi

}

md_notes
