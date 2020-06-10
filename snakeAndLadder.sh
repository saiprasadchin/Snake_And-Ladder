echo "Welcome to Snake and Ladder game"
position=0
echo "starting position is : $position"
function dice(){
	rollDice=$((RANDOM % 6 + 1))

}

declare -a playerOne

function gameBoard(){
        local zero=0
        local ladder=3
        local snake=2
        local noPlay=1
        position=$1
        check=$((RANDOM % 3 + 1))
        if [[ $check -eq $noPlay ]]
        then
                continue
        elif [[ $check -eq $snake ]]
        then
                dice
                position=$(( $position - $rollDice ))
                if [[ $position -lt $zero ]]
                then
                        position=$zero
                fi
        elif [[ $check -eq $ladder ]]
        then
                dice
                position=$(( $position + $rollDice ))
        fi

        if [ $position -gt $winning ]
        then
                position=$(($position-$rollDice))
        fi

        return $position
}

winning=100
positionOne=0

while [[ $positionOne -ne $winning ]]
do
        let numberOfDice++
        gameBoard $positionOne
        positionOne=$?
        playerOne[$numberOfDice]=$positionOne

done

for (( i=1; i<=$numberOfDice; i++))
do
        echo "dice roll : $i--> Position at:${playerOne[$i]}"
done

echo "player at position $position"
echo "Total number of times Dice roll : $numberOfDice"

