echo "Welcome to Snake and Ladder game"
position=0
echo "starting position is : $position"
function dice(){
	rollDice=$((RANDOM % 6 + 1))

}
zero=0
ladder=2
snake=3
noPlay=1
winning=100

while [[ $position -ne $winning ]]
do
        let numberOfDice++
	check=$((RANDOM % 3 + 1))
	if [ $check -eq $noPlay ]
	then
        	continue
	elif [ $check -eq $snake ]
	then
        	dice
        	position=$(( $position - $rollDice ))
		if [ $position -lt $zero ]
        	then
	        	position=$zero
        	fi
       	elif [ $check -eq $ladder ]
	then
        	dice
        	position=$(( $position + $rollDice ))
	fi
	if [ $position -gt $winning ]
        then
                position=$(( $position - $rollDice ))
        fi
done
echo "player at position $position"
echo "Total number of times Dice roll : $numberOfDice"

