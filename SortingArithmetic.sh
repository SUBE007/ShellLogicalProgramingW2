#!/bin/bash -x
echo "=======================Welcome To Sorting ArithMatic=================================="
echo "Enter the Three Value a,b,c"
#---------read three value
read a
read b
read c
count=0
declare -A dict

function computeEquations()
{
local a=$1
local b=$2
local c=$3
#-----------computed The Equation
equation1=$(($a+$b*$c))
equation2=$(($a*$b+$c))
equation3=$(($c+$a/$c))
equation4=$(($a%$b+$c))
#-----------Storing into Dictinoary
dict[1]=$equation1
dict[2]=$equation2
dict[3]=$equation3
dict[4]=$equation4
#echo "all value:${array[@]}"
#-----------read from dictinoary to array
array[ ((count++)) ]=${dict[1]}
array[ ((count++)) ]=${dict[2]}
array[ ((count++)) ]=${dict[3]}
array[ ((count++)) ]=${dict[4]}
#echo "all value in array:${array[@]}"
#-----------sorted In decending the array 
for((i=0;i<${#array[@]};i++))
 do
	for((j=0;j<${#array[@]}-$i-1;j++))
	do
		if((${array[$j]}<${array[$j+1]}))
		then
			temp=${array[$j]}
			array[$j]=${array[(($j+1))]}
			array[$j+1]=$temp
		fi
	done
done
echo "after sorting in decending the array:${array[@]}"


#-----------sorted In ascending the array
for((i=0;i<${#array[@]};i++))
 do
        for((j=0;j<${#array[@]}-$i-1;j++))
        do
                if((${array[$j]}>${array[$j+1]}))
                then
                        temp=${array[$j]}
                        array[$j]=${array[(($j+1))]}
                        array[$j+1]=$temp
                fi
        done
done
echo "after sorting ascending the array:${array[@]}"
}

computeEquations $a $b $c

