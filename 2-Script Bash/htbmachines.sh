#!/bin/bash

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

function ctrl_c(){
  echo -e "\n\n${redColour}[!] Saliendo...${endColour}\n"
  tput cnorm && exit 1 # Para poder recuperar el CURSOR en todo momento en caso de falla
}

# Ctrl + C
trap ctrl_c INT

# Variables GLOBALES
main_url="https://htbmachines.github.io/bundle.js"

function helpPanel(){
  echo -e "\n${yellowColour}[+]${endColour} ${grayColour}Usos:${endColour}"
  echo -e "\t${purpleColour}m)${endColour} ${grayColour}Buscar por un nombre de maquina${endColour}"
  echo -e "\t${purpleColour}d)${endColour} ${grayColour}Buscar maquinas por dificultad (Fácil, Media, Difícil, Insane)${endColour}"
  echo -e "\t${purpleColour}o)${endColour} ${grayColour}Buscar maquinas por sistema operativo (Linux, Windows)${endColour}"
  echo -e "\t${purpleColour}u)${endColour} ${grayColour}Descargar o Actualizar archivos necesarios${endColour}"
  echo -e "\t${purpleColour}i)${endColour} ${grayColour}Buscar por direccion IP${endColour}"
  echo -e "\t${purpleColour}y)${endColour} ${grayColour}Obtener URL de la resolucion de la maquina en YouTube${endColour}"
  echo -e "\t${purpleColour}h)${endColour} ${grayColour}Mostrar este panel de ayuda${endColour}\n"
}

function searchMachine(){
  machineName="$1"
  machineName_checker="$(cat bundle.js | awk "/name: \"$machineName\"/,/resuelta:/" | grep -vE "id:|sku:|resuelta" | tr -d '"' | tr -d ',' | sed 's/^ *//')"
  if [ "$machineName_checker" ]; then
    echo -e "\n${yellowColour}[+]${endColour} ${grayColour}Listando las propiedades de la maquina${endColour}${blueColour} $machineName${endColour}${grayColour}:${endColour}\n"
    cat bundle.js | awk "/name: \"$machineName\"/,/resuelta:/" | grep -vE "id:|sku:|resuelta" | tr -d '"' | tr -d ',' | sed 's/^ *//'
  else
    echo -e "\n${redColour}[!] El nombre de la maquina proporcionada no existe${endColour}\n"
  fi
}

function updateFiles(){
  if [ ! -f bundle.js ]; then
    tput civis
    echo -e "\n${yellowColour}[+]${endColour} ${grayColour}Descargando los archivos necesarios...${endColour}\n"
    curl -s $main_url > bundle.js
    js-beautify bundle.js | sponge bundle.js
    echo -e "\n${greenColour}[+]${endColour} ${greenColour}Todos los archivos han sido descargado correctamente${endColour}\n"
    tput cnorm
  else
    tput civis
    curl -s $main_url > bundle_temp.js
    js-beautify bundle_temp.js | sponge bundle_temp.js

    md5_temp_value=$(md5sum bundle_temp.js | awk '{print $1}')
    md5_old_value=$(md5sum bundle.js | awk '{print $1}')
    if [ "$md5_temp_value" == "$md5_old_value" ]; then
      echo -e "\n${greenColour}[+] Archivos se encuentran actualizados${endColour}\n"
      rm bundle_temp.js
    else
      echo -e "\n${yellowColour}[+]${endColour} ${grayColour}Actualizando archivos necesarios...${endColour}\n"
      rm bundle.js && mv bundle_temp.js bundle.js
      echo -e "\n${greenColour}[+] Archivos actualizados correctamente${endColour}\n"
    fi

    tput cnorm
  fi
}

function searchIP(){
  ipAddress="$1"
  machineName="$(cat bundle.js | grep "ip: \"$ipAddress\"" -B 3 | grep "name: " | awk 'NF{print $NF}' | tr -d '"' | tr -d ',')"
  if [ "$machineName" ]; then
    echo -e "\n${yellowColour}[+]${endColour} ${grayColour}El nombre de la  maquina correspondiente a la IP${endColour}${redColour} \"$ipAddress\"${endColour}${grayColour} es${endColour} ${redColour}\"$machineName\"${endColour}\n"
  else
    echo -e "\n${redColour}[!] La direccion IP proporcionada no existe${endColour}\n"
  fi
}

function urlYoutube(){
  machineName=$1
  url="$(cat bundle.js | awk "/name: \"$machineName\"/,/resuelta:/" | grep -vE "id:|sku:|resuelta" | tr -d '"' | tr -d ',' | sed 's/^ *//' | grep youtube | awk 'NF{print $NF}')"
  if [ "$url" ]; then
    echo -e "\n${yellowColour}[+]${endColour}${grayColour} El enlace URL de YouTube de la maquina${endColour}${redColour} $machineName${endColour}${grayColour} es:${endColour}${redColour} \"$url\"${endColour}\n"
  else
    echo -e "\n${redColour}[!] El nombre de la maquina proporcionada no existe${endColour}\n"
  fi
}

function difficultyMachine(){
  difficulty="$1"
  difficulty_checker="$(cat bundle.js | grep "dificultad: \"$difficulty\"" -B 5 | grep name | awk 'NF{print $NF}' | tr -d '"' | tr -d ',' | column)"
  if [ "$difficulty_checker" ]; then
    echo -e "\n${yellowColour}[+]${endColour}${grayColour} Estas son las maquinas con la dificultad${endColour} ${greenColour}$difficulty${endColour}\n"
    cat bundle.js | grep "dificultad: \"$difficulty\"" -B 5 | grep name | awk 'NF{print $NF}' | tr -d '"' | tr -d ',' | column
  else
    echo -e "\n${redColour}[!] Esta dificultad ingresada no existe o esta mal escrita${endColour}"
    echo -e "\n${yellowColour}[+]${endColour}${grayColour} Dificultades de maquinas:${endColour}${greenColour} Fácil - Media - Difícil - Insane${endColour}\n"
  fi
}

function systemOperative(){
  so="$1"
  so_checker="$(cat bundle.js | grep "so: \"$so\"" -B 5 | grep "name: " | awk 'NF{print $NF}' | tr -d '"' | tr -d ',' | column)"
  if [ "$so_checker" ]; then
    echo -e "\n${yellowColour}[+]${endColour}${grayColour} Maquinas con el Sistema Operativo${endColour} ${greenColour}$so${endColour}\n"
    cat bundle.js | grep "so: \"$so\"" -B 5 | grep "name: " | awk 'NF{print $NF}' | tr -d '"' | tr -d ',' | column
  else
    echo -e "\n${redColour}[!] Sistema Operativo ingresado no existe${endColour}\n"
  fi
}

function getOSDifficulty(){
  difficulty="$1"
  so="$2"

  checker_result="$(cat bundle.js | grep "so: \"$so\"" -C 4 | grep "dificultad: \"$difficulty\"" -B 5 | grep "name: " | awk 'NF{print $NF}' | tr -d '"' | tr -d ',' | column)"

  if [ "$checker_result" ]; then
    echo -e "\n${yellowColour}[+]${endColour} ${grayColour}Listando maquinas de dificultad${endColour}${greenColour} $difficulty${endColour}${grayColour} que tengan sistema operativo${endColour}${greenColour} $so${endColour}\n"
    cat bundle.js | grep "so: \"$so\"" -C 4 | grep "dificultad: \"$difficulty\"" -B 5 | grep "name: " | awk 'NF{print $NF}' | tr -d '"' | tr -d ',' | column
  else
    echo -e "\n${redColour}[!] Dificultad o Sistema Operativo no existen${endColour}\n"
  fi
}

# Indicadores
declare -i parameter_counter=0

# Chivatos
declare -i chivato_difficulty=0
declare -i chivato_so=0

# Hacer un menu
while getopts "m:d:o:ui:y:h" arg; do
  case $arg in
    m) machineName=$OPTARG; let parameter_counter+=1;;
    d) difficulty=$OPTARG; chivato_difficulty=1; let parameter_counter+=5;;
    o) so=$OPTARG; chivato_so=1; let parameter_counter+=6;;
    u) let parameter_counter+=2;;
    i) ipAddress=$OPTARG; let parameter_counter+=3;;
    y) machineName=$OPTARG; let parameter_counter+=4;;
    h) helpPanel;;
  esac
done

# Condicional
if [ $parameter_counter -eq 1 ]; then
  searchMachine $machineName
elif [ $parameter_counter -eq 2 ]; then
  updateFiles
elif [ $parameter_counter -eq 3 ]; then
  searchIP $ipAddress
elif [ $parameter_counter -eq 4 ]; then
  urlYoutube $machineName
elif [ $parameter_counter -eq 5 ]; then
  difficultyMachine $difficulty
elif [ $parameter_counter -eq 6 ]; then
  systemOperative $so
elif [ $chivato_difficulty -eq 1 ] && [ $chivato_so -eq 1 ]; then
  getOSDifficulty $difficulty $so
else
  helpPanel
fi
