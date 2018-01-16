#!/bin/bash

IFS=$'\n'       # make newlines the only separator

cd ~/Desktop
export FILES="$(ls)"

FOLDER='~/Doccuments/screenshots'
FOUND=0

for f in $FILES
do
	echo "hit $f"
    if [[ $f == *"Screen Shot"* ]]; then
        echo "moving $f"
        mv $f $FOLDER
        let "FOUND += 1"
    fi
done

if [[ $FOUND -gt 0 ]] 
then
    osascript -e 'display notification "'$FOUND' screenshots archived" with title "evanextreme/janitor"'
fi

