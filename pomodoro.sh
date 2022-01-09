#!/usr/bin/bash

if [[ $# -ne 1 ]] && [[ $# -ne 3 ]]
    then
        echo "Usage: pomodoro.sh MIN (X Y)"
        echo "Set a timer for MIN minutes"
        echo "Optionally move the timer window to coordinate X, Y"
        exit
fi

# Timer for $MIN minutes
MIN=$1
SEC=$(bc <<< "60*$1")


echo Start a timer for $MIN minutes...

# Show work progress
timeout $SEC ~/.dotfiles/ShellScripts/zenityProgress.sh $MIN &

if [ $# -eq 3 ]
    then
        # Screen coordinate
        X=$2
        Y=$3

        echo Moving window to $X, $Y...

        sleep 1

        xdotool getactivewindow windowmove $X $Y
fi


# Sleep and pop notification after $SEC seconds
sleep $SEC && zenity --question --text="$MIN minutes passed by.\nWhy not take a break? :P" --timeout=$(bc <<< "60*7") &

# Count for 7 minutes break
