function MJ
         set year (date +%Y)
         set month (date +%m)
         set day (date +%d)
         set today (date +%Y-%m-%d)
         set myDir /home/donagh/sd64/1donaghs-stuff/personal/journal/$year/$month
         set filen $day-$month.md

         if test ! -d $myDir
             mkdir -p $myDir
         end

         if  test -e $myDir/$filen  
            $EDITOR "+normal Go" $myDir/$filen 
         else
            begin
            touch $filen
            echo "$today

### Notes
" >>  $filen
        $EDITOR +5 $filen
            end
         end
end
