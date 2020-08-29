#!/bin/bash

D=`date +"+%F"`
touch $HOME/temp
grep ^$D $HOME/position.log > $HOME/temp

i=1
while [ $i le 50 ]
do
  a="Army$i"
  af="AirForce$i"
  n="Navy$i"
  #read from log file
  buff=(`head -3 $HOME/temp`)
  # redirect output(only date and position) to respective file.
  echo "${buff[0]}----------${buff[2]}  ${buff[3]}" >> /home/airforce/$af/post_allotted.txt
  echo "${buff[4]}----------${buff[6]}  ${buff[7]}" >> /home/army/$a/post_allotted.txt
  echo "${buff[8]}----------${buff[10]}  ${buff[11]}" >> /home/navy/$n/post_allotted.txt
  sed -i '1,3d' $HOME/temp
   $i=` expr $i + 1 `
done

rm $HOME/temp
