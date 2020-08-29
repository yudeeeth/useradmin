#!/bin/bash

left=287041
right=771025
D=`date +"+%F"`
D="+2020-04-13"
#touch $HOME/Code/Usermake/attendance.log
a=(`grep ^$D $HOME/Code/Usermake/position.log | sed 's/'"$D"'-00.00.00//' | sed 's/N°//' | sed 's/E°//' | sed 's/\.//g' | sed 's/ //'`)
b=(`grep ^$D $HOME/Code/Usermake/attendance.log | sed 's/'"$D"'-06.00.00 //'`)

#list to get top 10
list=(162000000000000 162000000000000 162000000000000 162000000000000 162000000000000 162000000000000 162000000000000 162000000000000 162000000000000 162000000000000)
#actual list wich will hold users
aclist=(0 0 0 0 0 0 0 0 0 0)

function dostuff {
a[$2]=`expr $2 - $left `
a[$3]=`expr $3 - $right `
first=`expr ${a[$2]} \* ${a[$2]} `
second=`expr ${a[$3]} \* ${a[$3]} `
val=`expr $first + $second `

j=9
while [ $j -gt 0 ] && [ $val -lt ${list[$j]} ]
do
list[$j]=${list[`expr $j - 1 `]}
aclist[$j]=${aclist[`expr $j - 1 `]}
j=`expr $j - 1 `
done
list[$j]=$val
aclist[$j]=${a[$1]}
}
i=0
while [ $i -lt 130 ]
do
two=`expr $i \* 2 `
three=`expr $i \* 3 `
[ "${b[`expr $two + 1 `]}" == YES ] && dostuff $three `expr $three + 1 ` `expr $three + 2 `
i=`expr $i + 1 `
done

echo ${aclist[0]} ${aclist[1]} ${aclist[2]} 
echo ${aclist[3]} ${aclist[4]} ${aclist[5]} 
echo ${aclist[6]} ${aclist[7]} ${aclist[8]} ${aclist[9]} 
