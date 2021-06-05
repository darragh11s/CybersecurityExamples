#!/bin/bash
File=$(grep -rH "-" ../Player_Analysis | awk -F " " '{print $1}' | cut -c20- | rev | cut -c31- | rev| uniq | xargs)
IFS=" "	   read -ra files  <<< "$File"
for k in ${files[@]}
do
	Time=$(cat ../Player_Analysis/$k* | grep "-" | awk -F : '{print $1, $2, $3}' | awk -F " " '{print $1, $2, $3, $4}' | sed 's/ /:/g' | xargs)
	IFS="M"    read -ra array  <<< "$Time"
	for i in ${array[@]}
	do
		i=$(echo $i |sed  's/,/ /g' | sed 's/:/ /3')
		i=$i"M"	
		dealer=$(cat ../Dealer_Analysis/$k* | grep "$i" | awk -F " " '{print $5, $6}')
		Times=$(echo "$Times" "$i")
		if [[ "$dealer" == "$dealer" ]]; then
			dealertimes=$((dealertimes+1))
		else
			dealertimes=1
		fi
	done
	echo -e "Date: $k \n Time: $Times \n Dealer: $dealer Number of losses $dealertimes \n" >> ../Dealer_Analysis/Notes_Dealer_Analysis		
done
