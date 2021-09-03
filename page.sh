#!bin/bash


debutPage="<html> <head><title>mes blagues</title></head><body>"
finPage="</body></html>"
baliseh2Ouvrante="<h2>"
baliseh2Fermante="</h2>"


recommence=true
declare -a monTableau
while $recommence;
    do
            echo "tu veux une blague sur chuck norris ?"

            read reponse

            if [ $reponse = oui ]
                then
                blague=$(curl -s https://api.chucknorris.io/jokes/random|jq -r '.value')


                else categories=$(curl --silent https://api.chucknorris.io/jokes/categories|jq -r '.[]')

                for categorie in ${categories[@]}
                do echo $categorie 
                done
                echo "---------------------------------------"
                echo "tu veux une blague de quel catégories ?"

                read reponse

                blague=$(curl -s https://api.chucknorris.io/jokes/random?category=$reponse|jq -r '.value')

            fi
    
            echo $blague
            echo "------------------"

            echo "on la garde celle la ?"
            read reponse
            if [ $reponse = oui ]
            then monTableau+=("$blague")
            echo ${monTableau[@]}

            fi
            echo "encore une ?"
            read reponseEncore
            if [ $reponseEncore != oui ]
                then
                recommence=false
            fi
    done

echo " Ca te dirais de les noter ?"
read ouiOunon

if [ $ouiOunon = oui ] 
then 

pageWeb=""
pageWeb+=$debutPage
for blagueChuck in "${monTableau[@]}"
do
blagueHtml=""
blagueHtml+=$baliseh2Ouvrante
blagueHtml+="$blagueChuck"
blagueHtml+=$baliseh2Fermante

pageWeb+=$blagueHtml
done

pageWeb+=$finPage

echo $pageWeb > index.html
cp index.html /var/www/html/index.html

   
fi


