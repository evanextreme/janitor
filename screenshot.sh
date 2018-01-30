#!/bin/bash

IFS=$'\n'       # make newlines the only separator

cd ~/Desktop
export FILES="$(ls)"

FOLDER='/Users/evan/Documents/screenshots'
FOUND=0

for f in $FILES
do
    if [[ $f == *"Screen Shot"* ]]; then
        mv $f $FOLDER
        let "FOUND += 1"
    fi
done

if [[ $FOUND -gt 0 ]] 
then
    osascript -e 'display notification "to folder '$FOLDER'" with title "evanextreme/janitor" subtitle "'$FOUND' screenshots archived"'
fi

