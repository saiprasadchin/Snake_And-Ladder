echo "Welcome to Snake and Ladder game"
position=0
echo "starting position is : $position"
function dice(){
	rollDice=$((RANDOM % 6 + 1))

}

declare -a playerOne
declare -a playerTwo
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

        if [[ $position -gt $winning ]]
        then
                position=$(($position-$rollDice))
        fi

        return $position
}

winning=100
positionOne=0
positionTwo=0
while [[ $positionOne -ne $winning && $positionTwo -ne $winning ]]
do
        let numberOfDice++
        gameBoard $positionOne
        positionOne=$?
        playerOne[$numberOfDice]=$positionOne

        gameBoard $positionTwo
        positionTwo=$?
        playerTwo[$numberOfDice]=$positionTwo


done

echo "player1 at position : $positionOne"
echo "player2 at position : $positionTwo"
echo "Total number of times Dice roll : $numberOfDice"
echo "WINNER"
echo "======"
if [ $positionOne -gt $positionTwo ]
then
        echo "Player1 Won the game"
else
        echo "Player2 Won the game"
fi
