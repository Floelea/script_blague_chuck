#!/bin/bash



echo "bonjour"

blagueRandom=$(curl -s https://api.chucknorris.io/jokes/random|jq -r '.value')

echo $blagueRandom