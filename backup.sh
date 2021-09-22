#!/bin/dash

a=$*
#echo $a
backup=".$a.*"
file=$(ls $backup) 2>/dev/null
#echo $file
count=0
for i in $file
do
	count=$(($count + 1))
done
#echo $count
new=".$a.$count"
cp $a $new
echo "Backup of '$a' saved as '$new'"

