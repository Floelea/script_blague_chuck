#!/bin/bash



categories=$(curl --silent https://api.chucknorris.io/jokes/categories|jq -r '.[]')

for categorie in ${categories[@]}
do echo $categorie 
done