#!/bin/bash

THREADS=$1
REPEATS=$2
RUN_DIR=$3
RESULT_DIR=$4

if test "$#" -ne 4
then
	echo "Usage: bash $0 <num_threads> <num_repeats> <run_dir> <results_dir>"
	exit 1
elif test -z $1
then 
	echo "Usage: bash $0 <num_threads> <num_repeats> <run_dir> <results_dir>"
	echo "<num_threads> must be positive"
	exit 1
else
	echo "Run all for $REPEATS times on $THREADS threads. Continue?[y/n]"
	read input
	if test $input != y
	then 
		echo Aborted
		exit 1
	fi
fi
