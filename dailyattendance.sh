#!/bin/bash

rm /home/ChiefCommander/attendance_report.txt
touch /home/ChiefCommander/attendance_report.txt

cat /home/airforce/AirForceChief/attendance_record.txt >> /home/ChiefCommander/attendance_report.txt
cat /home/army/ArmyGeneral/attendance_record.txt >> /home/ChiefCommander/attendance_report.txt
cat /home/navy/NavyMarsall/attendance_record.txt >> /home/ChiefCommander/attendance_report.txt


