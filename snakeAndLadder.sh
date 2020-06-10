echo "Welcome to Snake and Ladder game"
position=0
echo "starting position is : $position"
function dice(){
	rollDice=$((RANDOM % 6 + 1))

}

ladder=2
snake=3
noPlay=1

check=$((RANDOM % 3 + 1))
echo "check : $check"
if [ $check -eq $noPlay ]
then
        echo "No play"
elif [ $check -eq $snake ]
then
        dice
        position=$(( $position - $rollDice ))
        echo "Snack = player at position : $position"
elif [ $check -eq $ladder ]
then
        dice
        position=$(( $position + $rollDice ))
        echo "Ladder = player at position : $position"
fi

