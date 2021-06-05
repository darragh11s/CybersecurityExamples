#!/bin/bash
echo "enter a date in mmdd format without any /"
read Date
echo "enter the time in 12 hour format hh"
read Time
echo "AM or PM"
read amPm
echo "enter the game type, Roulette, Blackjack or Texas (Leave blank to list all 3 dealers)"
read game_type

if [ -z "$Date" ] || [ -z "$Time" ];
then
	echo "Date and Time cannot be left blank"
	exit 0
fi

if ! [[ "$Date" =~ ^[+-]?[0-9]+\.?[0-9]*$ ]] || ! [[ "$Time" =~ ^[+-]?[0-9]+\.?[0-9]*$ ]];
then
	echo "Date and Time must be numbers"
	exit0
fi

if [[ $amPm =~ "AM"  ]]; then
	Time=$Time":00:00 AM"
else
	Time=$Time":00:00 PM"
fi
Roulette=$(cat ../Dealer_Analysis/$Date* | grep "$Time" | awk -F " " '{print $5, $6}')
Blackjack=$(cat ../Dealer_Analysis/$Date* | grep "$Time" | awk -F " " '{print $3, $4}')
Texas=$(cat ../Dealer_Analysis/$Date* | grep "$Time" | awk -F " " '{print $7, $8}')
game_type=$(tr '[:upper:]' '[:lower:]' <<< $game_type)

if [[ $game_type =~ "roulette" ]]; then
	echo "The Roulette dealer at $Time on the $Date was $Roulette"
elif [[ $game_type =~ "blackjack" ]] ; then
	echo "The Blackjack dealer at $Time on the $Date was $Blackjack"
elif [[ $game_type =~ "texas" ]]; then
	echo "The Texas dealer at $Time on the $Date was $Texas"
else	
	echo -e "The Roulette dealer at $Time on the $Date was $Roulette '\n' The blackjack dealer was $Blackjack '\n' The Texas dealer was $Texas"
fi


