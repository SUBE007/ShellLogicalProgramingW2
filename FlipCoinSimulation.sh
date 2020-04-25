#!/bin/bash -x

count1=0
count2=0
count3=0
function FlipCoinSimulation()
{
hc1=0 tc1=0
local number=$1
local temp1=$number
local cointime=$2
local temp2=$cointime
for((i=0;i<$number;i++))
do
str=""
	for((j=0;j<$cointime;j++))
	do
	hc=$((RANDOM%2))

	if(($hc==1))
	then
		str=$str"H"
		hc1=$(($hc1+1))
	else
		str=$str"T"
		tc1=$(($tc1+1))
	fi
	done
htcarray[ ((count3++)) ]=$str
done
echo "No. of heads:$hc1"
echo "No. of tails:$tc1"
 #echo "percentage of head:"
hcc=$(awk -v a=$hc1 -v b=$(($hc1+$tc1)) 'BEGIN {print(a/b*100)}')

 #echo "percentage of tails:"
 tcc=$(awk -v a=$tc1 -v b=$(($hc1+$tc1)) 'BEGIN {print(a/b*100)}')
htarray1[ ((count1++)) ]=$hcc
htarray2[ ((count2++)) ]=$tcc
echo "Winning Combination array of head % of coin:${htarray1[@]} "
echo "array of Tail % of coin:${htarray2[@]} "

echo "array of H/T of coin:${htcarray[@]} "


}
echo "============================Weclom to flipCoinSimulation=========================== "
echo "Enter How many time flip the coin for Singlet:"
read number1
echo "For siglet coin:"
cointime=1

FlipCoinSimulation $number1 $cointime
#-------------------------------------

echo "Enter How many time flip the coin for doublet:"
read number2
echo "For Doublet :"
cointime2=2

FlipCoinSimulation $number2 $cointime2

echo "Enter How many time flip the coin for Triplet:"
read number3
echo "For Triplet :"
cointime3=3

FlipCoinSimulation $number3 $cointime3


