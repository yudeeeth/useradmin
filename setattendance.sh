#!/bin/bash

D=`date +"+%F"`
touch $HOME/temp
grep ^$D $HOME/attendance.log >> $HOME/temp
D=`date +%u`
i=1
while [ $i le 50 ]
do
buff=(`head -3 $HOME/temp`)
sed -i '1,3d' $HOME/temp
[ "${buff[2]}" == YES] && echo "${buff[0]} ${buff[1]}" >> /home/airforce/AirForceChief/attendance_record.txt && echo "$D ${buff[0]} ${buff[1]}" >> /home/airforce/AirForceChief/currweek.txt
[ "${buff[5]}" == YES] && echo "${buff[3]} ${buff[4]}" >> /home/army/ArmyGeneral/attendance_record.txt && echo "$D ${buff[3]} ${buff[4]}" >> /home/army/ArmyGeneral/currweek.txt
[ "${buff[8]}" == YES] && echo "${buff[6]} ${buff[7]}" >> /home/navy/NavyMarsall/attendance_record.txt && echo "$D ${buff[6]} ${buff[7]}" >> /home/navy/NavyMarsall/currweak.txt
$i=` expr $i + 1 `
done
rm $HOME/temp
