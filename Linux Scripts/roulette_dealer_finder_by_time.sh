#!/bin/bash
echo "enter a date in mmdd format without any /"
read Date
echo "enter the time in 12 hour format hh"
read Time
echo "AM or PM"
read amPm

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

	echo -e "\nThe Roulette dealer at $Time on the $Date was $Roulette \nThe blackjack dealer was $Blackjack \nThe Texas dealer was $Texas"


