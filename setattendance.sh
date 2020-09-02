#!/bin/bash

D=`date +"+%F"`
D="+2020-04-17"
buff=(`grep ^$D /root/userad/attendance.log`)
D=`date +%u`
var=9
i=1
while [ $i -le 50 ]
do
[ "${buff[$(($(( $(($i - 1)) * $var)) + 2))]}" == YES ] && echo "${buff[$(($(( $(($i - 1)) * $var)) + 2))]} ${buff[$(($(( $(($i - 1)) * $var)) + 1))]}" >> /home/airforce/AirForceChief/attendance_record.txt && echo "$D ${buff[$(($(( $(($i - 1)) * $var)) + 0))]} ${buff[$(($(( $(($i - 1)) * $var)) + 1))]}" >> /home/airforce/AirForceChief/currweek.txt
[ "${buff[$(($(( $(($i - 1)) * $var)) + 2))]}" == YES ] && echo "${buff[$(($(( $(($i - 1)) * $var)) + 2))]} ${buff[$(($(( $(($i - 1)) * $var)) + 1))]}" >> /home/army/ArmyGeneral/attendance_record.txt && echo "$D ${buff[$(($(( $(($i - 1)) * $var)) + 0))]} ${buff[$(($(( $(($i - 1)) * $var)) + 1))]}" >> /home/army/ArmyGeneral/currweek.txt
[ "${buff[$(($(( $(($i - 1)) * $var)) + 2))]}" == YES ] && echo "${buff[$(($(( $(($i - 1)) * $var)) + 2))]} ${buff[$(($(( $(($i - 1)) * $var)) + 1))]}" >> /home/navy/NavyMarsall/attendance_record.txt && echo "$D ${buff[$(($(( $(($i - 1)) * $var)) + 0))]} ${buff[$(($(( $(($i - 1)) * $var)) + 1))]}" >> /home/navy/NavyMarsall/currweak.txt
i=$(( $i + 1 ))
done

