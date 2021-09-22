#!/bin/dash
#cd .girt
#cat index.txt
#cd - 
#cat a.txt

#a=1
#a=$(( $a + 1))
#echo $a

#a=$( diff a.txt ab.txt)
#b=$( diff a.txt abc.txt)
#echo ${#a}
#echo ${#b}

a=$(cat log.txt)
echo $a
for i in $a
do
	echo $i
done
