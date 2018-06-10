#!/bin/bash

REPEATS=$1
RUN_DIR=$2
RESULT_DIR=$3
#if test -z $1
if test "$#" -ne 3
then
	echo "Usage: bash $0 <num_repeats> <RUN_DIR> <result dir>"
	exit 1
elif test -z $1
then
	echo "Usage: bash $0 <num_repeats> <run_dir> <result dir>"
	echo "<num_repeats> need to be positive!"
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

if test -d $RESULT_DIR
then
	echo "results dir exists. "
else
	echo "Creating results dir. "
	mkdir $RESULT_DIR
fi

for i in `seq $REPEATS`
do 
	echo "Iteration $i out of $REPEATS."
	$RUN_DIR/run-all.sh > $RESULT_DIR/${i}
done
