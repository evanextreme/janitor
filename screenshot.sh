#!/bin/bash

IFS=$'\n'       # make newlines the only separator

export DESKTOP="$(find ~/Desktop -name "Screen Shot*.png")"

SCREENSHOT_PATH='/Users/evan/Documents/Screenshots'
FOUND=0

for f in $DESKTOP
do
    if [[ $f == *"Screen Shot"* ]]; then
        mv $f $SCREENSHOT_PATH
        let "FOUND += 1"
    fi
done

export SCREENSHOTS="$(find $SCREENSHOT_PATH -name "Screen Shot*.png" -mmin +4320)"

TRASH_PATH='/Users/evan/.Trash'
TRASH=0

for f in $SCREENSHOTS
do
    if [[ $f == *"Screen Shot"* ]]; then
        mv $f $TRASH_PATH
        let "TRASH += 1"
    fi
done



if [[ $FOUND -gt 0 ]] 
then
    osascript -e 'display notification "added to the Screenshot stack" with title "evanextreme/janitor" subtitle "'$FOUND' screenshots archived"'
fi

