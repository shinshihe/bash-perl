#!/bin/bash
a=$2
b=$1
n=$1
x=0
#echo "number is $b"
str=$(echo -e $b | sed 's/[0-9]//g')
#echo "len is  $str"
len=${#str}
#echo "len is $len"
if test $len -ne 0
then
	echo "./echon.sh: argument 1 must be a non-negative integer"
	exit
fi


if test $# -ne 2
then 
	echo 'Usage: ./echon.sh <number of lines> <string>'
	exit
fi

while test $x -ne $n
do
	let x=x+1
        echo $a
done


