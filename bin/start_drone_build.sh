#!/bin/bash

if [[ -z ${1} ]]
then
	echo "No branch tag defined"
	exit 1
fi

script_dir=$(dirname ${0})

VERSION="$($script_dir/get_version.sh package.json)"
echo "Version: $VERSION"
$script_dir/make_drone_file.sh "$VERSION" "${1}"