#!/bin/bash

# ----------------- START journal ------------------------------
# my easy journal
# shortcut is -> % mj
# Set up the journal directory on the Toshiba external 128GB USB drive. Note added 2024-02-01.
# journal='/run/media/donagh/USB128GB/DONAGHS/personal/journal'
# removed ## Headings and ### Subheadings following my escape from hospital as I found them 'de trop'.
# added separate PROMPTS for DIARY & JOURNALLING on 2024-02-01

# DECEDITOR="vim -u /home/donagh/PORTABLE_ENV/vim/vimrc_files/minimal_vimrc "

# Edited: 2026-07-22; 2026-03-27 

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
    cd $myDir
    touch $filen
    # front matter for new day's journal:
    echo "# FRONT MATTER

~/PORTABLE_ENV/dotfiles/scripts/.scripts/markdown_journal.sh            Bash script 


# DIARY
> $dow     $today

# PUBLIC

## WEATHER
Morning: 
Afternoon: 

# ==========================================================

## EVENTS OF THE DAY



## WHAT'S GOING ON & HAPPENING

### In my life


### In my head


### With my future


### With public me


### With other people



# PRIVATE




# ==========================================================

## STATUS

### HEALTH - MEDICAL & PHYSICAL


### MENTAL


### SOCIAL


### PLANS


### WORK


### FINANCIAL

#### Standing


#### Income


#### Spending


#### Saving / investing





### THINGS


### SPIRITUAL
(and related)


## ACTIVITY


### Exercise


### Jobs


### Projects 


### Learning


### Entertainment


### Games

Connections: x rows; y lives used ; Scoring: 1,2,4,3; 
(Note: ⎽ <leader>u in insert mode)

Wordle: x rows ABCDE

Lichess: z% Current rating:


### Reading



## XOTD

X of the day where X could be:

concept
event
highlight
insight
joke
loss
person
quote
speculation
win
word

This would help me to appreciate (and be grateful for / more aware of) the stuff that "made my day".




" >>$filen
    $EDITOR +5 $filen
  else
    # $EDITOR "+normal Go" $filen
    # I want to open the journal in buffer not a tab. Note added 2024-07-05
    $EDITOR $filen
  fi

}

md_journal
