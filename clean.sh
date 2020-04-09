#!/bin/bash

if [[ -d "_site" ]]
then
cd _site
echo "i am in site"
rm -rf *
cd ..
fi