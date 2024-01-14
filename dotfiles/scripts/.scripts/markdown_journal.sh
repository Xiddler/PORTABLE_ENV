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
        # myDir='/run/media/donagh/01d4c077-4709-4b5b-9431-087bc9060d68/DONAGHS/personal/journal/'$year/$month
        myDir='/run/media/donagh/USB128GB/DONAGHS/personal/journal/'$year/$month
        mkdir -p $myDir
        local filen=$myDir/`date +%d-%m`\.md
        if [ ! -f $filen ]; 
        then
            touch $filen
            # front matter for new day's journal:
            echo "# FRONT MATTER
$today
Script ~/PORTABLE_ENV/dotfiles/scripts/.scripts/markdown_journal.sh 
Ur_Journal ~/DONAGHS/all_org/journal.org
me.org $HOME/DONAGHS/personal/me.org


## PROMPTS

HEALTH - HEARBEAT RATE; MEDICAL; CHEST ISSUE; ALCOHOL; APETITE; SLEEP; WEIGHT / WAIST; OUTDOORS / EXERCISE; FOOD; PAIN/ABSENCE;
SELF - PERSONALITY / CHARACTER / PERSONAL DEVELOPMENT; 
TOWARDS GETTING REAL; TOWARDS COMING TO LIFE
WEM = WORK / EARNING / MONEY / INCOME
TASKS / TODO
LIVING COSTS
IDEAS; CREATIVITY
READING
GOALS; PLANNING; VISION;
SOCIAL - MEETINGS; CHATS; COMMUNICATIONS; SHARING; CONTRIBUTING;
JOYS; BLESSINGS; GRATITUDE; 
BOTHERS; ISSUES; WOES;
STATE OF MIND; MOOD / FEELINGS / EMOTIONS; 
IT; DATA
LEARNING TIL (today I learnt)



# ____________________________________________________________________________
# DIARY
> $day 


NOTABLE



WEATHER
Morning: 


HEALTH


WEMI


DOINGTODAY


MOVING TOWARDS BEING FULLY REAL
Some questions to help focus on this...

> What level of connection to reality do I sense today?
> Where/About what do I currently feel most real?
> What am I nonsensing / fooling / deceiving / lying to myself about?
> Who / what do I actually care about? (Do I care that I don't seem to care?...)
> What can I sense / decide / do that is (more) real & consequential today?
> Can I plan/imagine/dream some sort of future life for myself?
Others
> What underlying issues am I not addressing?
> What am I planning?  What end/conclusion/goal am I actually seeking and effectively moving towards?
> What about: joy, lightness, fun, love, laughter, liveliness, humour?
> Am I drifting/treading water/dallying/loitering/waiting for something to happen or the opposite?
> What things do I think are important and am faffing about with and spending time on but really getting nowhere on?
> Can I stop asking questions that I can't / won't answer and instead look at living life itself?
> Have I access to being serious, grounded, responsible, connected ref. adult matters incl. work, people etc.?



# ____________________________________________________________________________
# JOURNALLING 
> $day 



" >>  $filen
        $EDITOR +5 $filen
        else
           $EDITOR "+normal Go" $filen 
        fi

}

md_journal
