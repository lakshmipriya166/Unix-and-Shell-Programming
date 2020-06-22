#!/bin/bash
emp=./emp
choice=1
prompt="$(echo -e "\nChoice:\n\t1. Find\n\t2. Add\n\t3. Delete\n\t4. Display\n\t5. Alter\n\t0. Exit\nEnter choice: ")"
while [ true ]
do
	echo  "$prompt"
	read choice
	case $choice in
	1) read -p "Enter name: " name
	   line=$(grep "$name" $emp)
	   if [ -n "$line" ]; then
		echo "$line"
	   else
		echo "Record does not exist!"
	   fi
	   ;;
	2) read -p "Enter name: " name
	   read -p "Enter f1: " f1
	   read -p "Enter f2: " f2
	   echo -e "${name}\t${f1}\t${f2}" >> $emp
	   sort $emp > temp
	   mv temp $emp
	   cat $emp
	   ;;
	3) read -p "Enter name: " name
	   line=$(grep "$name" $emp)
	   $(sed /"$line"/d $emp > temp)
	   mv temp $emp
	   cat $emp
	   ;;
	4) cat $emp
	   ;;
	5) read -p "Enter name: " name

	   read -p "Enter alter: " alter
	   newline=$(sed -n "/"$name"/ s/\t\(.*\)\t/\t"$alter"\t/p" $emp)
	   $(sed /"$name"/c\\"$newline" $emp > temp)
	   mv temp $emp
	   cat $emp
	   ;;
	0) exit ;;
	esac
done
