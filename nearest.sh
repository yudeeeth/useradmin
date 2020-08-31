#!/bin/bash

left=287041
right=771025
D=`date +"+%F"`
D="+2020-04-17"
#touch $HOME/Code/Usermake/attendance.log
a=(`grep ^$D $HOME/Code/Usermake/position.log | sed 's/'"$D"'-00.00.00//' | sed 's/N°//' | sed 's/E°//' | sed 's/\.//g' | sed 's/ //'`)
b=(`grep ^$D $HOME/Code/Usermake/attendance.log | sed 's/'"$D"'-06.00.00 //'`)

#list to get top 10
list=(162000000000000 162000000000000 162000000000000 162000000000000 162000000000000 162000000000000 162000000000000 162000000000000 162000000000000 162000000000000)
#actual list wich will hold users
aclist=(0 0 0 0 0 0 0 0 0 0)

function dostuff {
a[$2]=$(($2 - $left))
a[$3]=$(($3 - $right))
first=$((${a[$2]} * ${a[$2]}))
second=$((${a[$3]} * ${a[$3]}))
val=$(($first + $second))

j=9
while [ $j -gt 0 ] && [ $val -lt ${list[$j]} ]
do
list[$j]=${list[$(($j - 1))]}
aclist[$j]=${aclist[$(($j - 1))]}
j=$(($j - 1))
done
list[$j]=$val
aclist[$j]=${a[$1]}
}
i=0
while [ $i -lt 130 ]
do
two=$(($i * 2))
three=$(($i * 3))
[ "${b[$(($two + 1))]}" == YES ] && dostuff $three $(($three + 1)) $(($three + 2))
i=$(($i + 1))
done

touch /home/yudeeeth/Code/Usermake/nearest.txt
echo ------------------------------------------------------- >> /home/yudeeeth/Code/Usermake/nearest.txt
i=0
while [ $i -lt 10 ]
do
echo "$D ${aclist[$i]}" >> /home/yudeeeth/Code/Usermake/nearest.txt
i=$(($i + 1))
done
echo ------------------------------------------------------- >> /home/yudeeeth/Code/Usermake/nearest.txt
