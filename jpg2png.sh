#!/bin/bash
file=()
IFS=$(echo -en "\n\b")
for f in *
do
	file+=($f)
 	#echo $f
done
jpg=()
png=()
for i in ${file[@]}
do
	tmp=${i#*.}
	if [ "$tmp" == "jpg" ]
	then
		jpg+=($i)
	#	echo $i
	fi
	if [ "$tmp" == "png" ]
	then
		png+=($i)
	fi
done 
for i in ${jpg[@]}
do
	for j in ${png[@]}
	do
		tmp1=${i%.*}
		tmp2=${j%.*}
		if [ "$tmp1" == "$tmp2" ]
		then
			echo "$j already exists"
			exit
		fi
	done
done
for i in ${jpg[@]}
do
	tmp=${i// /}
	#echo $tmp
	len1=${#tmp}
	len2=${#i}
	add=".png"
	if [ $len1 -ne $len2 ]
	then
		add2=".png"
		name=${i%.*}
		pngname=${name}${add2}
		#jpgname=${jpgname/ /}
		#echo $jpgname
		convert $i $pngname 2>/dev/null
	else
		name=${i%.*}
		pngname=${name}${add}
		#echo $jpgname
		convert $i $pngname 2>/dev/null
	fi
done
rm -f *.jpg


