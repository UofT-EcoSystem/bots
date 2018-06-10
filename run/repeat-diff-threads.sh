#!/bin/bash

REPEATS=$1
RUN_DIR=$2
RESULT_DIR=$3

NUM_THREAD_ARRY=(1 2 4 8 16 28 48 56)

if test "$#" -ne 3
then
	echo "Usage: bash $0 <num_repeats> <run_dir> <results_dir>"
	exit 1
elif test -z $1
then 
	echo "Usage: bash $0 <num_repeats> <run_dir> <results_dir>"
	echo "<num_repeats> must be positive"
	exit 1
else
	echo "Run all for $REPEATS times on ${#NUM_THREAD_ARRY[@]} configs of threads. Continue?[y/n]"
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

for i in "${NUM_THREAD_ARRY[@]}"
do 
	for j in `seq $REPEATS`
	do
		echo "Iteration $j out of $REPEATS on $i threads. "
		$RUN_DIR/run-all.sh -c $i > $RESULT_DIR/${j}_${i}
	done
done
