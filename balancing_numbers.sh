#!/bin/bash
#a=1
#echo $
#a=$*
a=$(cat)
#echo $*
#echo "The input is $a"
IFS=$'\n' b=($a)
for i in ${b[@]}
do
	#echo $i
	echo $i | tr '0-4' '<'| tr '6-9' '>' 
done

#echo $a



