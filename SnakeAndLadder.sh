#!/bin/bash -x
#CONSTANTS
PLAYER=2
NUMBER=0
LADDER=1
SNAKE=2
#VARIABLES
position1=0
position2=0
diceCount=0
#PLAY GAME
function play()
{
    #PLAY TILL WINNING POSITION REACHES
    while [[ $position1 -lt 100 && $position2 -lt 100 ]]
    do
       for (( counter=1; counter<=$PLAYER; counter++ ))
       do
         #PLAYER 1 PLAYS
         if [[ $counter -eq 1 ]]
         then
            die=$((RANDOM%6+1))
            random=$((RANDOM%3))
            case $random in
               $NUMBER)
                  position1=$(($position1 + $NUMBER));;
               $LADDER)
                  position1=$(($position1 + $die)) ;;
               $SNAKE)
                  position1=$(($position1 - $die)) ;;
            esac
            if [[ $position1 -gt 100 ]]
            then
               position1=$(($position1-$die))
            fi 
      
            if [[ $position1 -eq 100 ]]
            then
               echo "Player $counter won"
               break
            fi

            if [[ $position1 -lt 0 ]]
            then
               position1=0
            fi
         fi
         #PLAYER 2 PLAYS
         if [[ $counter -eq 2 ]]
         then
            die=$((RANDOM%6+1))
            random=$((RANDOM%3))
            case $random in
               $NUMBER)
                  position2=$(($position2 + $NUMBER));;
               $LADDER)
                  position2=$(($position2 + $die)) ;;
               $SNAKE)
                  position2=$(($position2 - $die)) ;;
            esac
 
            if [[ $position2 -gt 100 ]]
            then
               position2=$(($position2-$die))
            fi 

            if [[ $position2 -eq 100 ]]
            then
               echo "Player $counter won"
               break
            fi

            if [[ $position2 -lt 0 ]]
            then
               position2=0
            fi
         fi

      done
   done
}
play 
