#!/bin/bash


case "`date | awk '{print $2 }'`" in

        Jan) MON=01 ;;
        Feb) MON=02 ;;
        Mar) MON=03 ;;
        Apr) MON=04 ;;
        May) MON=05 ;;
        Jun) MON=06 ;;
        Jul) MON=07 ;;
        Aug) MON=08 ;;
        Sep) MON=09 ;;
        Oct) MON=10 ;;
        Nov) MON=11 ;;
        Dec) MON=12 ;;
esac

echo $MON

