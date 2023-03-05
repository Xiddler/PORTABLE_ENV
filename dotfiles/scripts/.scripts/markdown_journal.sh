#!/bin/bash


# ----------------- START journal ------------------------------
# my easy journal 
# shortcut is -> % mj
# Set up the journal directory on the SD64 Card
# journal='/run/media/donagh/c60cbdfc-37a8-4e08-b2dd-6286d16beb3d/SD35-BACKUP/1donaghs-stuff/personal/journal'
#
md_journal() {
        local year=`date +%Y`
        local month=`date +%m`
        local today=`date +%Y-%m-%d`
        local day=`date +%A`
        # local myDir='/home/donagh/sd64/1donaghs-stuff/personal/journal/'$year/$month
        local
        # myDir='/home/donagh/Donaghs_Tmp/journal/'$year/$month
        # myDir='/home/donagh/SD64/DONAGHS/journal/'$year/$month
        myDir='/run/media/donagh/01d4c077-4709-4b5b-9431-087bc9060d68/DONAGHS/personal/journal/'$year/$month
        mkdir -p $myDir
        local filen=$myDir/`date +%d-%m`\.md
        if [ ! -f $filen ]; 
        then
            touch $filen
            # front matter for new day's journal:
            echo "$today
Script ~/PORTABLE_ENV/dotfiles/scripts/.scripts/markdown_journal.sh 
Ur_Journal ~/DONAGHS/all_org/org/journal.org

> $day 


# DIARY

## Highlight



## Weather



## Mind / mood



## Health


### Hearbeat rate
BPM= 

### Chest issue
(not pains, not continuous, what? nothing? something? - minor occasional spasms usually after food)




### Alcohol 



### Sleep



### Weight / waist 



### Outdoors / exercise



### Food


## Money / Work 
(Prompt: Realistically, there is no living without money. It goes out. Does it come in? How?)




## Towards getting real
(incl. Money, People)



## Ideas



## Planning 
(Prompt: Progress- / outcome-monitoring applies to some activities, not journalling)



## Social



## Personality / Character / Personal development 



## IT 



# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# JOURNALLING 



" >>  $filen
        $EDITOR +5 $filen
        else
           $EDITOR "+normal Go" $filen 
        fi

}

md_journal
