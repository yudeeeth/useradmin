#!/bin/bash

#set permissions for scripts to be only run by root/Chief

chmod 000  $HOME/delta1.sh
chmod 000  $HOME/delta2.sh
chmod 000  $HOME/delta3.sh
chmod 000  $HOME/delta4.sh

#put delta 5(alias script) in #!/usr/bin/env bash

echo "source $HOME/delta5.sh" >> /bin/.bashrc

#set permissions for position and attendance.log should be accessible to chief

#making files and setting permissions so one can only view and not delete
i=1
while [ $i le 50 ]
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
   $i=` expr $i + 1 `
done


#install commands in crontab
touch $HOME/something123
crontab -l > $HOME/something123
echo "0 0 * * * bash /home/yudeeeth/delta/delta3.sh" >> $HOME/something123
crontab $HOME/something123
rm $HOME/something123


#create text files, no need to set permissions
touch /home/army/ArmyGeneral/attendance_record.txt
touch /home/airforce/AirForceChief/attendance_record.txt
touch /home/navy/NavyMarsall/attendance_record.txt


#set crontab
touch $HOME/something123
crontab -l > $HOME/something123
echo "0 6 * * * bash /home/yudeeeth/delta/delta4.sh" >> $HOME/something123
crontab $HOME/something123
rm $HOME/something123



#create text files, no need to set permissions
touch /home/army/ArmyGeneral/lastweek.txt
touch /home/airforce/AirForceChief/lastweek.txt
touch /home/navy/NavyMarsall/lastweek.txt

touch /home/army/ArmyGeneral/currweek.txt
touch /home/airforce/AirForceChief/currweek.txt
touch /home/navy/NavyMarsall/currweek.txt


#set crontab for the thing that updates stuff everyweek
touch something123
crontab -l > something123
echo "0 0 0 * * bash /home/yudeeeth/delta/delta6.sh" >> something123
crontab something123
rm something123

#fetch.sh only accesssible to troop leaders

#sets alias
alias userGenerate="bash $HOME/delta1.sh"
alias permit="bash $HOME/delta2.sh"
alias autoSchedule="bash $HOME/delta3.sh"
alias attendance="bash $HOME/delta4.sh"
alias record="bash $HOME/delta"
