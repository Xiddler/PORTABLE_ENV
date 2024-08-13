#!/bin/bash


# ----------------- START journal ------------------------------
# my easy journal 
# shortcut is -> % mj
# Set up the journal directory on the Toshiba external 128GB USB drive. Note added 2024-02-01.
# journal='/run/media/donagh/USB128GB/DONAGHS/personal/journal'
# removed ## Headings and ### Subheadings following my escape from hospital as I found them 'de trop'.
# added separate PROMPTS for DIARY & JOURNALLING on 2024-02-01
#
md_journal() {
        local year=`date +%Y`
        local month=`date +%m`
        local today=`date +%Y-%m-%d`
        local dow=`date +%A`
        local myDir='/run/media/donagh/USB128GB/DONAGHS/personal/journal/'$year/$month
        mkdir -p $myDir
        # local filen=$myDir/`date +%d-%m`\.md
        local filen=$myDir/$(date +%d-%m)\.md

        if [ ! -f $filen ]; 
        then
            touch $filen
            # front matter for new day's journal:
            echo "# FRONT MATTER
$today

~/PORTABLE_ENV/dotfiles/scripts/.scripts/markdown_journal.sh            Bash script 
~/DONAGHS/personal/me.org                                               me.org 
~/DONAGHS/personal/ONE_LONG_HARD_LOOK.md                                1LHL 
~/DONAGHS/personal/Questions_to_real.md                                 QtR 


# MY DIARY
> $dow

WEATHER
Morning: 
Afternoon: 

HEALTH


FORM MOOD


COGNITION


SOCIAL COGNITION


FUTURE
What can I do now to put something good in my future? What have I to look forward to?


STRESSORS / ANXIETY INDUCERS



ANTI-STRESSORS



FEEL FOR LIFE



QUESTIONS



THE BREEZE


NATURE


NOTABLE


NEW or DIFFERENT


LEARNINGS


WEMI


DOINGTODAY
 AGENDA


 CTS
  Journalling:
  Reading:


# ____________________________________________________________________________
## DIARY PROMPTS

WEATHER
 Morning:
 Afternoon:
NOTABLE
HEALTH 
LEARNINGS

DOINGTODAY
 CTS
 ILHL: entries

 AGENDA / TASKS / TODO


WEMI = WORK / EARNING / MONEY / INCOME
NEW or DIFFERENT
LIVING COSTS
IDEAS; CREATIVITY
SOCIAL - MEETINGS/INTERACTIONS
GOAL IMPLEMENTING
IT; DATA




# ____________________________________________________________________________
# MY JOURNALLING
> $day 

 
## JOURNALLING PROMPTS

MOVING TOWARDS BEING FULLY REAL
    [ Some questions to help focus on this...  See file at ~/DONAGHS/personal/Questions_to_real.md ]
TOWARDS GETTING REAL; TOWARDS COMING TO LIFE
SOCIAL - MEETINGS; CHATS; COMMUNICATIONS; SHARING; CONTRIBUTING;
SELF - PERSONALITY / CHARACTER / PERSONAL DEVELOPMENT; 
STRUGGLES & SUCCESSES
TRIGGERS - RECORDING & UNDERSTANDING 
JOYS; BLESSINGS; GRATITUDE; 
BOTHERS; ISSUES; WOES;
STATE OF MIND; MOOD / FEELINGS / EMOTIONS; 



" >>  $filen
        $EDITOR +5 $filen
        else
           $EDITOR "+normal Go" $filen 
        fi

}

md_journal
