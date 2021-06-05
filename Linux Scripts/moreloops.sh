#!/bin/bash
paths=(/etc/shadow /etc/passwd)   	# defines path of files
for i in "${paths[@]}"; do		# starts loop through files listed in paths variable
	echo $(ls -lah $i)		# prints the file permissions of each file in each list
done					# ends loop

users=$(ls /home)
for j in "${users[@]}";do
	echo $j
	sudoer=$(id $j | grep -o sudo)
	if [ $sudoer == sudo ]; then
		echo "$j has sudo privalleges"
	else
		echo "$j does not have sudo access"
	fi
	continue
done



