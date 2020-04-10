#!/bin/bash

if [[ -z ${1} ]]
then 
	echo "No version defined!"
	exit 1
fi;

if [[ -z ${2} ]]
then 
	echo "No branch defined!"
	exit 1
fi;


script_dir=$(dirname ${0})
template="$script_dir/target-drone-template.yml";
version_minor=$(echo ${1} | sed 's/^\(.*\)\..*$/\1/') 
version_major=$(echo ${1} | sed 's/^\([^.]*\)\..*$/\1/')

cat $template \
	| sed "s/{{VERSION}}/${1}/" \
	| sed "s/{{BRANCH}}/${2}/" \
	| sed "s/{{VERSION_MINOR}}/$version_minor/" \
	| sed "s/{{VERSION_MAJOR}}/$version_major/" \
	 > .drone.yml