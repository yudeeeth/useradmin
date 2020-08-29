#!/bin/bash

grep ^$1 $HOME/lastweek.txt | sed 's/'"$1"' //'