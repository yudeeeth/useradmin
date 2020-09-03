#!/bin/bash
# This program clearly doesnt calculate the accurate distance between chief commander,(considering cuvature of earth)
# but it is important to know that the values we get here will relatively be in the same order as closeness 

#coordinates of chief commander
left=287041
right=771025

#gets date but date hardcoded coz current dates do not exist in log files given
D=`date +"+%F"`
D="+2020-04-17"

#grep position list to a and attendance list to b
a=(`grep ^$D /root/userad/position.log | sed -e 's/'"$D"'-00.00.00//' -e 's/N°//' -e 's/E°//' -e 's/\.//g' -e 's/ //'`)
b=(`grep ^$D /root/userad/attendance.log | sed 's/'"$D"'-06.00.00 //'`)

#list to get top 10, it needs to have largest possible value, i tool 
list=(162000000000000 162000000000000 162000000000000 162000000000000 162000000000000 162000000000000 162000000000000 162000000000000 162000000000000 162000000000000)
#actual list wich will hold users
aclist=(0 0 0 0 0 0 0 0 0 0)

#pushes values and names back into the list when smaller(insertion sort kind of idea)
function dostuff {
    a[$2]=$(($2 - $left))
    a[$3]=$(($3 - $right))
    val=$(($((${a[$2]} * ${a[$2]})) + $((${a[$3]} * ${a[$3]}))))
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

#iterates thru list of all troops
#also are navy troops on land?
#why?
i=0
while [ $i -lt 150 ]
do
    two=$(($i * 2))
    three=$(($i * 3))
    [ "${b[$(($two + 1))]}" == YES ] && dostuff $three $(($three + 1)) $(($three + 2))
    i=$(($i + 1))
done

#puts the nearest ten from aclist into required file
touch /home/ChiefCommander/nearest.txt
echo ------------------------------------------------------- >> /home/ChiefCommander/nearest.txt
i=0
while [ $i -lt 10 ]
do
echo "$D ${aclist[$i]}" >> /home/ChiefCommander/nearest.txt
i=$(($i + 1))
done
echo ------------------------------------------------------- >> /home/ChiefCommander/nearest.txt
