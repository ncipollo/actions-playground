#!/usr/bin/env bash

TAG=0.0.74

date >> text/text1.txt
git add .
git commit -m "bump"
git push
git tag -f $TAG
git push -f origin $TAG
