#!/bin/bash

IFS=$'\n'       # make newlines the only separator

cd ~/Desktop
export FILES="$(ls)"

for f in $FILES
do
	echo "hit $f"
    if [[ $f == *"Screen Shot"* ]]; then
        echo "moving $f"
        mv $f ./screenshots
    fi
done
