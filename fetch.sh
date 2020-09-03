#!/bin/bash
#simple grep to get sruff from last week. and sed to deleting the leading number.
#if argument is passed, if not it prints everything in lastweek(with the day number), this is definitely not a bug, but feature
grep ^$1 $HOME/lastweek.txt | sed 's/'"$1"' //'