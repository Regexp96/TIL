#!/bin/bash

cd ~/Documents/TIL
git add .
git commit -am "$1"
git push
echo "$1"
