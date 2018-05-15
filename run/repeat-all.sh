#!/bin/bash

REPEATS=$1
if test -z $1
then
	echo "Usage: bash $0 <num_repeats>"
	exit 1
else 
	echo "Run all for $REPEATS times. Continue?[y/n]"
	read input
	if test $input != y
	then 
		echo Aborted
		exit 1
	fi
fi

if test -d ../results
then
	echo "results dir exists. "
else
	echo "Creating results dir. "
	mkdir ../results
fi

for i in `seq $REPEATS`
do 
	echo "Iteration $i out of $REPEATS."
	./run-all.sh > ../results/${i}
done
