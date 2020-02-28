#!/bin/bash -x

PLAYER=1
NUMBER=0
LADDER=1
SNAKE=2
position=0

function play()
{
   while [[ $position -lt 100 ]]
   do
      die=$((RANDOM%6+1))
      random=$((RANDOM%3))
      case $random in
         $NUMBER)
            position=$(($position + $NUMBER));;
         $LADDER)
            position=$(($position + $die)) ;;
         $SNAKE)
            position=$(($position - $die)) ;;
      esac

      if [[ $position -gt 100 ]]
      then
         position=$(($position-$die))
      fi 
      
      if [[ $position -eq 100 ]]
      then
         echo "You won"
         break
      fi

      if [[ $position -lt 0 ]]
      then
         position=0
      fi
    done
}
play
echo "Position: $position"
