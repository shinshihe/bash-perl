#!/bin/bash
path=$1
files=$(ls $path)
small=()
med=()
big=()
for filename in $files
do
	#echo $( wc -l $filename)
	tmp=$(echo $(wc -l  $filename)  )
	#$(echo cat $filename | wc -l)
	split=(${tmp// / })
	a=$((10#${split[0]}))
	#echo ${split[0]}
	#echo ${split[1]}
	#echo $a
	if test $a -lt 10
       	then
		small+=(${split[1]})
	elif test $a -gt 100
       	then
		big+=(${split[1]})
	else 
		med+=(${split[1]})
	fi
done
echo "Small files: ${small[@]}"
echo "Medium-sized files: ${med[@]}"
echo "Large files: ${big[@]}"

