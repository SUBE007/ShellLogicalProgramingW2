#!/bin/bash -x

echo "----------------Welcome to Snake And Ladder(Moksha Patam) Game-----------------"
player1_count=100
player2_count=100
pos_count1=0
pos_count2=0
function Gamer1()
 {
	if (( $pos_count1<$player1_count ))
	then
	dicevalue=$(($((RANDOM%6))+1))
	checkvalue=$((RANDOM%3))
     pos_count1=$(($pos_count1+$dicevalue))

		if (($checkvalue==0))
		then
		 pos_count1=$pos_count1

		elif [ $checkvalue -eq 1 ]
		then
			pos_count1=$pos_count1
			case $pos_count1 in
				11)pos_count1=31 ;;
				20)pos_count1=40 ;;
				50)pos_count1=89 ;;
				60)pos_count1=98 ;;
				*)pos_count1=$pos_count1 ;;
			esac
		 else
			pos_count1 = $pos_count1
                        case $pos_count1 in
                                21)pos_count1=5  ;;
                                30)pos_count1=10 ;;
                                55)pos_count1=17 ;;
                                98)pos_count1=20 ;;
				 *)pos_count1=$pos_count1 ;;
			esac
	        fi
fi
if(($pos_count1==100))
then
	echo "Gamer1 Won Snake And Ladder Game"
else
	Gamer2
fi
}
#---------------------------------------
function Gamer2()
{
	if (( $pos_count2<$player2_count ))
	then
	dicevalue=$(($((RANDOM%6))+1))
	checkvalue=$((RANDOM%3))
	pos_count2=$(($pos_count2+$dicevalue))

		if (($checkvalue==0))
		then
		pos_count2=$pos_count2

		elif [ $checkvalue -eq 1 ]
		then
		 pos_count2=$pos_count2
			case $pos_count2 in
				11)pos_count2=31 ;;
				20)pos_count2=40 ;;
				50)pos_count2=89 ;;
				60)pos_count2=98 ;;
				*)pos_count2=$pos_count2 ;;
			esac
		 else
	         pos_count2=$pos_count2
                        case $pos_count2 in
                                21)pos_count2=5 ;;
                                30)pos_count2=10 ;;
                                55)pos_count2=17 ;;
                                98)pos_count2=20 ;;
                                *)pos_count2=$pos_count2 ;;
			esac
		fi
fi
if(($pos_count2==100))
then
	echo "Gamer2 Won Snake And Ladder Game"
else
  Gamer1
fi

}
#--------------------------game start Here-------------------------
function playerDecide()
{
 toss=$((RANDOM%2))
 if(($toss==1))
 then
	echo "Gamer1 Won the toss"
         Gamer1
else
	echo "Gamer2 Won the toss"
	 Gamer2
fi
}
playerDecide



