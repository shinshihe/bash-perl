#!/bin/bash
name=()
for i in *
do
	echo "$i"
	name+=("$i")
done

for i in ${name[@]}
do
	echo "$i"
done

