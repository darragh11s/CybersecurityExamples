#!/bin/bash
date=$(cat ../Player_Analysis/Notes_Player_Analysis | grep time | awk -F " " '{print $4}')
Time=$(cat ../Player_Analysis/Notes_Player_Analysis | grep time | awk -F " " '{print $5, $6, $7, $8}')
combined=$(paste <(printf %s "$date") <(printf %s "$Time"))
IFS="M"    read -ra array  <<< "$Time"
for i in ${array[@]}
do
	echo "$i"
	#if [ $(grep -c $i ../Dealer_Analysis/Notes_Player_Analysis) -lt 2 ];then
	#       continue
#       else
#	       found=$(cat ../Dealer_Analysis/* | grep $i | awk -F " " '{print $5, $6}')
#		echo -e "${RED}NAME: $found \n At these times: $combined\n${NC}"
	
#	fi
done	
