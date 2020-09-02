#!/bin/bash


# put all files in /root/userad

#setfacl -Rm u:ChiefCommander:rmx /root/userad/
#put delta 5(alias script) in #!/usr/bin/env bash

echo "source /root/userad/aliases.sh" >> /bin/.bashrc

#set permissions for position and attendance.log should be accessible to chief

#making files and setting permissions so one can only view and not delete
i=1
while [ $i -le 50 ]
do
  a="Army$i"
  af="AirForce$i"
  n="Navy$i"
  #create text file
  touch /home/army/$a/post_allotted.txt
  touch /home/navy/$n/post_allotted.txt
  touch /home/airforce/$af/post_allotted.txt

  #change permissions
  chmod 000 /home/army/$a/post_allotted.txt
  chmod 000 /home/navy/$n/post_allotted.txt
  chmod 000 /home/airforce/$af/post_allotted.txt
  i=$(( $i + 1 ))
done


#install commands in crontab
touch /root/userad/something123
crontab -l > /root/userad/something123
echo "0 0 * * * bash /root/userad/assignpos.sh" >> /root/userad/something123
echo "0 6 * * * bash /root/userad/setattendance.sh" >> /root/userad/something123 
echo "0 0 0 * * bash /root/userad/updateweek.sh" >> /root/userad/something123
echo "1 6 * * * bash /root/userad/dailyattendance.sh" >> /root/userad/something123 
echo "1 6 * * * bash /root/userad/nearest.sh" >> /root/userad/something123 
crontab /root/userad/something123
rm /root/userad/something123


#create text files, no need to set permissions
touch /home/army/ArmyGeneral/attendance_record.txt
touch /home/airforce/AirForceChief/attendance_record.txt
touch /home/navy/NavyMarsall/attendance_record.txt

#create text files, no need to set permissions
touch /home/army/ArmyGeneral/lastweek.txt
touch /home/airforce/AirForceChief/lastweek.txt
touch /home/navy/NavyMarsall/lastweek.txt

touch /home/army/ArmyGeneral/currweek.txt
touch /home/airforce/AirForceChief/currweek.txt
touch /home/navy/NavyMarsall/currweek.txt

#fetch.sh only accesssible to troop leaders already true.
#give permissions to access fetch
setfacl -m u:NavyMarsall:r-x /root/userad/fetch.sh
setfacl -m u:ArmyGeneral:r-x /root/userad/fetch.sh
setfacl -m u:AirForceChief:r-x /root/userad/fetch.sh

#create attendance report
touch /home/ChiefCommander/attendance_report.txt