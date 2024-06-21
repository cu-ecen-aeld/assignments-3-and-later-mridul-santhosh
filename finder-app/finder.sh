#!/bin/bash

#check if the number of args are correct 
if [ $# -ne 2 ]; then
	echo "Error : Two arguments are required."
	exit 1
fi

# Assign arguments to variables
filesdir="$1"
searchstr="$2"

#check if the filesdir is a directory
if [ ! -d "$filesdir" ]; then
	echo "Error: $filesdir is not a directory."
	exit 1
fi

#count the number of files
file_count=$(find "$filesdir" -type f | wc -l)

#count the matching number of lines
match_count=$(grep -r "$searchstr" "$filesdir" | wc -l)

#print the results
echo "The number of files are $file_count and the number of matching lines are $match_count"
