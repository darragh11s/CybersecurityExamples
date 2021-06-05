#!/bin/bash
touch ../Player_Analysis/Notes_Player_Analysis
RED='\033[0;31m'
NC='\033[0m'
Data=$(cat ../Player_Analysis/[0-9]* |cut -c 22-| sed ':a;N;$!ba;s/\n/, /g'| sed 's/\s, /,/g'| sed 's/,\s/,/g' | sed 's/^ *//g'|xargs )
IFS=,    read -ra array  <<< "$Data"
for j in "${array[@]}"
do
	if [ "$(grep -ic "$j" ../Player_Analysis/Notes_Player_Analysis)" -gt 0 ]; then
		continue
	else
		numberoftimes=$(grep -i "$j" ./* | grep "-" |wc -l)
			if [ $numberoftimes -lt 1 ]; then
			continue
			else
				date=$(cat ../Player_Analysis/[0-9]* | grep -rHi "$j" | grep "-" | awk -F _ '{print $1}' | sed 's/03/MAR/g')
				Time=$(cat ../Player_Analysis/[0-9]* | grep "-" | grep -i "$j" | sed s'/M/M:/g' | awk -F : '{print $1, $2, $3}')
				combined=$(paste <(printf %s "$date") <(printf %s "$Time"))
					if [ $numberoftimes -gt 2 ];then
						echo -e "${RED}NAME: $j \n Number of losses: $numberoftimes \n At these times: $combined\n${NC}" >> ../Player_Analysis/Notes_Player_Analysis

					else 
						echo -e "NAME: $j \n Number of losses: $numberoftimes \n At these times: $combined\n" >> ../Player_Analysis/Notes_Player_Analysis
					fi
					
			fi

	fi
done

