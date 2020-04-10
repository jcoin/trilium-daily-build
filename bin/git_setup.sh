#!/bin/bash

echo "Cloning Target"
git clone https://github.com/jcoin/trilium.git ./trilium

cd trilium

echo "Adding Remote github"
git remote add githubMain https://github.com/zadam/trilium.git

echo "Fetching Github + Origin"
git fetch githubMain
git fetch origin
