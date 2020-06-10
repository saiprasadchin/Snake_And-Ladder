echo "Welcome to Snake and Ladder game"
position=0
echo "starting position is : $position"
function dice(){
rollDie=$((RANDOM % 6 + 1))
echo "Dice : $rollDie "
}
dice

