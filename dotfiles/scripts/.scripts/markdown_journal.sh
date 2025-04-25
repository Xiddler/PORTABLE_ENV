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
  local year=$(date +%Y)
  local month=$(date +%m)
  local today=$(date +%Y-%m-%d)
  local dow=$(date +%A)
  local myDir='/run/media/donagh/USB128GB/DONAGHS/personal/journal/'$year/$month
  mkdir -p $myDir
  # local filen=$myDir/`date +%d-%m`\.md
  local filen=$myDir/$(date +%d-%m)\.md

  if [ ! -f $filen ]; then
    touch $filen
    # front matter for new day's journal:
    echo "# FRONT MATTER
$today

~/PORTABLE_ENV/dotfiles/scripts/.scripts/markdown_journal.sh            Bash script 


# MY DIARY
> $dow

## WEATHER
Morning: 
Afternoon: 


## ACTIVITY



# CATEGORIES




## HEALTH


## CONTINUINGTODAY



## DOINGTODAY



### TODOS / ISSUES / PROBLEMS / TASKS



## CULTURE

## ENTERTAINMENT


## NATURE


## NEWS 



## SHOOTING THE BREEZE


## FORM & MOOD 


## NEW / DIFFERENT


## RECOVERY




" >>$filen
    $EDITOR +5 $filen
  else
    # $EDITOR "+normal Go" $filen
    # I want to open the journal in buffer not a tab. Note added 2024-07-05
    $EDITOR $filen
  fi

}

md_journal
