 #!/bin/bash -x

declare -A board
#-----------------------------setting the board
function setBoard(){
local n=$1
for ((i=1 ;i<=$n ; i++)) do
	for((j=1;j<=$n;j++))
	do
        	board[$i,$j]="_|"
	done
done
}
#-----------------------------display the board
function displayBoard(){
local n=$1
for((i=1;i<=3;i++))
do
	for((j=1;j<=3;j++))
	do
	echo -e "${board[$i,$j]} \c"
	done
echo
done
}
#------------------------------play Computer
function playComputer(){
 echo "Computer turn"
sym="O"
r=$(($(($RANDOM%n))+1))
c=$(($(($RANDOM%n))+1))
echo "com row & col:$r $c"
echo ${board[$r,$c]}

if [[ "${board[$r,$c]}" == "_|" ]]
then
    board[$r,$c]=$sym
	echo ${board[$r,$c]}
	 displayBoard
else
echo "Invalid input"
playComputer
fi

}
#--------------------------------play User
function playUser(){
	if(($count>o))
	then
		echo "User turn"
		echo "Enter the row and column"
		sym="X"
		read r
		read c
		echo "user row and col:$r $c"

	if [[ "${board[$r,$c]}" == "_|" ]]
	then
    	board[$r,$c]=$sym
        echo ${board[$r,$c]}
	 displayBoard
	else
	echo "Invalid input"
		if ((count>0))
		then
		playUser
		fi
	fi
fi
}
#------------------------------check for tie
function checkForTie(){
dash="_|"
local inc=0
for ((i=1 ; i <= 3 ;i++ ))
do
	for (( j=1;j<=3;j++))
	do
	if [[ ${board[$i,$j]} == $dash ]]
	then
	((inc++))
	fi
	done
done
if (( $inc == 0 ))
then
	clear
	echo "Match is tie play again..!"
	sleep 10
        bash TicTocGame.sh

fi
}
#----------------------------win checking method
function checkForWin(){
row1="${board[1,1]}${board[1,2]}${board[1,3]}"
row2="${board[2,1]}${board[2,2]}${board[2,3]}"
row3="${board[3,1]}${board[3,2]}${board[3,3]}"
col1="${board[1,1]}${board[2,1]}${board[3,1]}"
col2="${board[1,2]}${board[2,2]}${board[3,2]}"
col3="${board[1,3]}${board[2,3]}${board[3,3]}"
dia1="${board[1,1]}${board[2,2]}${board[3,3]}"
dia2="${board[1,3]}${board[2,2]}${board[3,1]}"
user="XXX"
comp="OOO"
#checking the match here
if [[ $row1 == $user || $row2 == $user || $row3 == $user || $col1 == $user || $col2 == $user || $col3 == $user || $dia1 == $user || $dia2 == $user ]]
then
	echo congradulations User Won.....!
	sleep 10
        bash TicTocGame.sh
elif [[ $row1 == $comp || $row2 == $comp || $row3 == $comp || $col1 == $comp || $col2 == $comp || $col3 == $comp || $dia1 == $comp || $dia2 == $comp ]]
then
	echo Congradulations Computer won...!
	 sleep 10
         bash TicTocGame.sh

fi
}
# Game starts from here.............................................>>>

echo "----------------------welcome to TicTacToe game....-------------------------------------"
echo "Enter the order:"
read n
	setBoard $n
	displayBoard $n
	echo "Symbol X for user"
	echo "Symbol O for Computer"
	echo "Toss value 0-->for computer ,1-->for user "
count=$(($n*$n))
gametoss=$((RANDOM%2))
echo "Toss value:$gametoss"
if (($gametoss==0 ))
then
	echo "Congrats Computer win the toss"
  while (($count>0))
  do
	playComputer
	count=$(($count-1))
	echo "count value:$count"
	checkForWin
	playUser
	count=$(($count-1))
	echo "count value:$count"
	checkForWin
	if (($count<0))
	then
	echo "Match TIE !!!!"
	fi
  done
else
	echo "Congrats User win the toss"
  while (($count>0))
  do
	playUser
	count=$(($count-1))
	echo "count value:$count"
	checkForWin
	playComputer
	count=$(($count-1))
	echo "count value:$count"
	checkForWin
	if (($count<0))
	then
	echo "Match TIE !!!!"
	fi
  done
fi





