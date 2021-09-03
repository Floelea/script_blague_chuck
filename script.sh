#!/bin/bash

echo "coucou"
echo "comment tu t'appelles"

read username
if [ $username = "pascal" ]
 then
 echo "je sais que c'est toi"
else
echo "salut je m'appelle $username"
fi
