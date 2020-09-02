#!/bin/bash

D=`date +"+%F"`
D="+2020-04-17"
buff=(`grep ^$D /root/userad/position.log`)
i=1
var=12
while [ $i -le 50 ]
do
  a="Army$i"
  af="AirForce$i"
  n="Navy$i"
  echo "${buff[$(($(( $(($i - 1)) * $var)) + 0))]}----------${buff[$(($(( $(($i - 1)) * $var)) + 2))]}  ${buff[$(($(( $(($i - 1)) * $var)) + 3))]}" >> /home/airforce/$af/post_allotted.txt
  echo "${buff[$(($(( $(($i - 1)) * $var)) + 4))]}----------${buff[$(($(( $(($i - 1)) * $var)) + 6))]}  ${buff[$(($(( $(($i - 1)) * $var)) + 7))]}" >> /home/army/$a/post_allotted.txt
  echo "${buff[$(($(( $(($i - 1)) * $var)) + 8))]}----------${buff[$(($(( $(($i - 1)) * $var)) + 10))]}  ${buff[$(($(( $(($i - 1)) * $var)) + 11))]}" >> /home/navy/$n/post_allotted.txt
  i=$(( $i + 1 ))
done

