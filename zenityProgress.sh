#!/usr/bin/bash

MIN=$1
TOTALSEC=$(bc <<< "60*$1")
SEC=0

(
while [ $SEC -le $TOTALSEC ]
do
    HUNDSEC=$(bc <<< "100 * $SEC")
    PROGRESS=$(bc <<< "$HUNDSEC / $TOTALSEC")
    echo '#' $SEC 'seconds of your life have passed...'
    sleep 1
    echo "$PROGRESS"
    let "SEC+=1"
done
) | zenity --progress --no-cancel

#--pulsate
