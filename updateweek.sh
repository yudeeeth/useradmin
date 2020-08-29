#!/bin/bash

#actual task makes lastweek.txt
rm /home/army/ArmyGeneral/lastweek.txt
mv /home/army/ArmyGeneral/currweek.txt /home/army/ArmyGeneral/lastweek.txt
touch /home/army/ArmyGeneral/currweek.txt

rm /home/navy/NavyMarsall/lastweek.txt
mv /home/navy/NavyMarsall/currweek.txt /home/navy/NavyMarsall/lastweek.txt
touch /home/navy/NavyMarsall/currweek.txt

rm /home/airforce/AirForceChief/lastweek.txt
mv /home/airforce/AirForceChief/currweek.txt /home/airforce/AirForceChief/lastweek.txt
touch /home/airforce/AirForceChief/currweek.txt
