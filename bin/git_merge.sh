#!/bin/bash

if [[ -z ${1} ]]
then 
	echo "No merge branch defined!"
	exit 1
fi;

merge_branch=${1}
script_dir=$(dirname ${0})

echo "$merge_branch: checking out"

# Checkout source and target to local tracking branches
git checkout -b "githubMain$merge_branch" githubMain/$merge_branch
if [[ $merge_branch = "master" ]]
then
	# Master is already checked out when we cloned.
	git checkout $merge_branch
else
	git checkout -b $merge_branch origin/$merge_branch
fi

# Merge source to target 
git merge "githubMain$merge_branch"

echo "$merge_branch: Merged, building drone script"

# Build a custom drone script, add it, and push
$script_dir/start_drone_build.sh $merge_branch
git add .drone.yml && git commit -m "AUTO: updating .drone.yml"

echo "$merge_branch: Pushing"

git push https://$GITUSER:$GITPASS@gitea.e9g.rocks/howard/trilium.git $merge_branch

echo "$merge_branch: Done"
