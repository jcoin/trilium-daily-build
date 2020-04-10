#!/bin/bash

if [[ -z ${1} ]]
then
	echo "No input file defined"
	exit 1
fi

while IFS= read -r line; do
	if [[ $line =~ \"version\":.*?\"([^\"]+)\" ]]
	then
		version="${BASH_REMATCH[1]}"
	fi
done < "$1"

if [[ -z $version ]]
then
	echo "No version found!"
	exit 1
fi;

echo $version
exit 0