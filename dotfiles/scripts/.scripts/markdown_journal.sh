#!/bin/bash


# ----------------- START journal ------------------------------
# my easy journal 
# shortcut is -> % mj
# Set up the journal directory on the SD64 Card
# journal='/run/media/donagh/c60cbdfc-37a8-4e08-b2dd-6286d16beb3d/SD35-BACKUP/1donaghs-stuff/personal/journal'
# removed ## Headings and ### Subheadings following my escape from hospital as I found them 'de trop'.
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

HIGHLIGHT



WEATHER



MIND / MOOD



HEALTH


HEARBEAT RATE
BPM= 

CHEST ISSUE
(not pains, not continuous, what? nothing? something? - minor occasional spasms usually after food)




ALCOHOL 



SLEEP



WEIGHT / WAIST 



OUTDOORS / EXERCISE



FOOD


MONEY / WORK 
(Prompt: Realistically, there is no living without money. It goes out. Does it come in? How?)




TOWARDS GETTING REAL
(incl. Money, People)



IDEAS



PLANNING 
(Prompt: Progress- / outcome-monitoring applies to some activities, not journalling)



SOCIAL



PERSONALITY / CHARACTER / PERSONAL DEVELOPMENT 



IT 



# ____________________________________________________________________________
# JOURNALLING 



" >>  $filen
        $EDITOR +5 $filen
        else
           $EDITOR "+normal Go" $filen 
        fi

}

md_journal
