> en este apartado se creo una carpeta llamada htbmachine dentro del directorio /opt, donde dentro de ella se creo un archivo sh llamado htbmachine.sh

curl -s -X GET https://htbmachines.github.io/bundle.js | js-beautify | grep Tentacle
    name: "Tentacle",

cat bundle.js | awk "/name: \"Forge\"/,/resuelta:/" | grep -vE "id:|sku:|resuelta" | tr -d '"' | tr -d ',' | sed 's/^ *//'

cat bundle.js | grep "ip: \"10.10.11.139\"" -B 3 | grep "name: " | awk 'NF{print $NF}' | tr -d '"' | tr -d ','

cat bundle.js | awk "/name: \"Forge\"/,/resuelta:/" | grep -vE "id:|sku:|resuelta" | tr -d '"' | tr -d ',' | sed 's/^ *//' | grep youtube | awk 'NF{print $NF}'

cat bundle.js | grep "dificultad: \"Media\"" -B 5 | grep name | awk 'NF{print $NF}' | tr -d '"' | tr -d ',' | column
cat bundle.js | grep "so: \"Linux\"" -B 5 | grep "name: " | awk 'NF{print $NF}' | tr -d '"' | tr -d ',' | column

cat bundle.js | grep "so: \"Linux\"" -C 4 | grep "dificultad: \"Media\"" -B 5 | grep "name: " | awk 'NF{print $NF}' | tr -d '"' | tr -d ',' | column