#!/bin/bash
minimum()
{
local low=$1
local high=$2
min=$low
local i=$low
while [[ $i<$high ]];do
	if [[ ${planet[$i]} < ${planet[$min]} ]]; then
		min=$i
	fi
	i=$((i+1))
done
}
swap()
{
	local temp=${planet[$1]}
	planet[$1]=${planet[$2]}
	planet[$2]=$temp
}

planet=(mercury venus earth mars)
for i in "${!planet[@]}";do
	minimum $i ${#planet[@]}
	swap $i $min
done

echo "${planet[@]}"
