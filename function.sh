#!/bin/dash

func(){
	echo "gg"
	return 0
}

result=$(func)
echo $result
