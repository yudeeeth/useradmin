#!/bin/bash

rm $HOME/attendance_report.txt
touch $HOME/attendance_report.txt

cat /home/airforce/AirForceChief/attendance_record.txt >> $HOME/attendance_report.txt
cat /home/army/ArmyGeneral/attendance_record.txt >> $HOME/attendance_report.txt
cat /home/navy/NavyMarsall/attendance_record.txt >> $HOME/attendance_report.txt

#similar shit
