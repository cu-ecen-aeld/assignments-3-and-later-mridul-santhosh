#!/bin/bash

#check if both the args are provided
if [  $# -ne 2 ]; then
	echo "Error 2 args are required"
	exit 1
fi

writefile="$1"
writestr="$2"

dir_path=$(dirname "$writefile")
mkdir -p "$dir_path"


if ! echo "$writestr" > "$writefile"; then
	echo "Error: could not create file $writefile"
	exit 1
fi

echo "File $writefile created successfully with content: $writestr"
