 #!/bin/bash -x
echo "==============Welcome In Gambling==============="
declare -A cashwon
declare -A cashlost
#===========Constant
stake=100
lossStake=50
winStake=150
bet=1
#===========Variable
countwin=0
countloss=0
day="Day"
totalcash=0


echo "day	win	loss"
for ((i=1;i<=20;i++))
do
		cash=$stake
		wins=0
		loss=0

	while (($cash>0))
	do
	if ((RANDOM%10>5))
	then
		((wins++))
		cash=$(($cash+$bet))
	else
		((loss++))
		cash=$(($cash-$bet))

	fi

	if (($cash==$winStake||$cash==$lossStake))
	then
		break
	fi
	done

	if (($wins>$loss))
	then
		cashwon[$i]=$(($cash-$stake))
	else
		cashlost[$i]=$(($stake-$cash))
	fi
		#totalcash=$(($totalcash+$cash-$stake))
		#countwin=$(($countwin+$wins))
		#countloss=$(($countloss+$loss))
		cashwonday[ (($i)) ]=$wins
		everycashwon[ (($i)) ]=$wins
		cashlostday[ (($i)) ]=$loss
		everycashlost[ (($i)) ]=$loss
		echo "day$i	$wins	$loss"
	done

luckday=$( printf "%s\n" ${cashwonday[@]} | sort -nr | head -1)
echo "highest wins : $luckday"

for ((k=1;k<=${#everycashwon[@]};k++))
do
if [[ $luckday -eq ${everycashwon[$k]} ]]
then
echo "luckest day : $k"
fi
done

unluckyday=$( printf "%s\n" ${cashwonday[@]} | sort -nr | tail -1)
echo "minimum losses : $unluckyday"

for (( count=1; count<=${#everycashwon[@]}; count++ ))
do
if [[ $unluckyday -eq ${everycashwon[$count]} ]]
then
echo "unluckestday : $count"
fi
done

if (( $(($countwin-$countloss)) < $(($stake*10)) ))
	then
	echo "Eligible for next Month"
else
	echo "Not eligible for next next Month"
fi
