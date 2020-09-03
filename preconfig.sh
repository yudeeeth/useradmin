#!/bin/bash

chmod +x aliases.sh
chmod +x assignpos.sh
chmod +x createuser.sh
chmod +x dailyattendance.sh
chmod +x fetch.sh
chmod +x nearest.sh
chmod +x setattendance.sh
chmod +x setpermisssions.sh
chmod +x updateweek.sh




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
  chmod 444 /home/army/$a/post_allotted.txt
  chmod 444 /home/navy/$n/post_allotted.txt
  chmod 444 /home/airforce/$af/post_allotted.txt
  i=$(( $i + 1 ))
done

#install commands in crontab
echo "0 0 * * * root bash /root/userad/assignpos.sh" >> /etc/crontab
echo "0 6 * * * root bash /root/userad/setattendance.sh" >> /etc/crontab 
echo "0 0 0 * * root bash /root/userad/updateweek.sh" >> /etc/crontab
echo "1 6 * * * root bash /root/userad/dailyattendance.sh" >> /etc/crontab
echo "1 6 * * * root bash /root/userad/nearest.sh" >> /etc/crontab

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
cp /root/userad/fetch.sh /home/army/ArmyGeneral/fetch.sh
cp /root/userad/fetch.sh /home/navy/NavyMarsall/fetch.sh
cp /root/userad/fetch.sh /home/airforce/AirForceChief/fetch.sh

#create attendance report
touch /home/ChiefCommander/attendance_report.txt