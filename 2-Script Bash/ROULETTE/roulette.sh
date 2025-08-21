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

function helpPanel(){
  echo -e "\n${yellowColour}[+]${endColour} ${grayColour}Usos:${endColour}"
  echo -e "\t${purpleColour}-m)${endColour} ${grayColour}Ver tu dinero${endColour}"
  echo -e "\t${purpleColour}-t)${endColour} ${grayColour}Tecnica a utilizar${endColour}${redColour} (martingala \ inverseLabroucheres)${endColour}"
  echo -e "\t${purpleColour}-h)${endColour} ${grayColour}Mostrar este panel de ayuda${endColour}\n"
}

function martingala(){
  echo -e "\n${yellowColour}[+]${endColour} ${grayColour}Vamos a jugar con la tecnica \"Martingala\", tu dinero actual es \$$money${endColour}"
  echo -ne "${purpleColour}[+] Cuanto dinero tienes pensado apostar? -> ${endColour}" && read initial_bet
  echo -ne "${purpleColour}[+] A que deseas apostar continuamente? (Par\Impar) -> ${endColour}" && read par_impar

  #echo -e "${yellowColour}[+]${endColour}${grayColour} Vas a jugar con una cantidad inicial de${endColour}${greenColour} \$$initial_bet ${endColour}${grayColour} apostando consecutivamente al${endColour}${greenColour} $par_impar${endColour}\n"
  
  backup_bet=$initial_bet
  play_count=1
  jugadas_malas="[ "
  tput civis # Ocultar el cursor en consola

  while true; do
    money=$(($money-$initial_bet))
    #echo -e "\n${turquoiseColour}[+] Acabas de apostar \$$initial_bet y tienes \$$money${endColour}"
    random_number="$(($RANDOM % 37))"
    #echo -e "${purpleColour}[+] Ha salido el numero $random_number${endColour}"

    if [ ! "$money" -le 0 ]; then
      if [ "$par_impar" == "par" ] && [ "$money" -ge "$initial_bet" ]; then
        if [ "$(($random_number % 2))" -eq 0 ]; then
          if [ "$random_number" -eq 0 ]; then
            #echo -e "[+] Ha salido 0, por tanto perdemos"
            #echo -e "[+] El numero que ha salido es PAR, PIERDES!"
            initial_bet=$(($initial_bet*2))
            #echo -e "[+] Ahora tienes \$$money"
            jugadas_malas+="$random_number "
          else
            #echo -e "[+] El numero que ha salido es PAR, GANAS!"
            reward=$(($initial_bet*2))
            #echo -e "[+] Ganas un total de \$$reward"
            money=$(($money+$reward))
            #echo -e "[+] Dinero actual: \$$money"
            initial_bet=$backup_bet
            jugadas_malas=""
          fi
        else
          #echo -e "[+] El numero que ha salido es IMPAR, PIERDES!"
          initial_bet=$(($initial_bet*2))
          #echo -e "[+] Ahora tienes \$$money"
          jugadas_malas+="$random_number "
        fi  
        #sleep 0.4
      elif [ "$par_impar" == "impar" ] && [ "$money" -ge "$initial_bet" ]; then
        if [ "$(($random_number % 2))" -eq 0 ]; then
          if [ "$random_number" -eq 0 ]; then
            #echo -e "[+] Ha salido 0, por tanto perdemos"
            #echo -e "[+] El numero que ha salido es PAR, PIERDES!"
            initial_bet=$(($initial_bet*2))
            #echo -e "[+] Ahora tienes \$$money"
            jugadas_malas+="$random_number "
          else
            #echo -e "[+] El numero que ha salido es PAR, PIERDES!"
            initial_bet=$(($initial_bet*2))
            #echo -e "[+] Ahora tienes \$$money"
            jugadas_malas+="$random_number "
          fi
        else
          #echo -e "[+] El numero que ha salido es IMPAR, GANAS!"
          reward=$(($initial_bet*2))
          #echo -e "[+] Ganas un total de \$$reward"
          money=$(($money+$reward))
          #echo -e "[+] Dinero actual: \$$money"
          initial_bet=$backup_bet
          jugadas_malas=""
        fi  
        #sleep 0.4
      else
        echo -e "\n${redColour}[!] No tienes dinero para seguir con la apuesta!!!${endColour}\n"
        echo -e "${yellowColour}[+] Dinero actual \$$money y apuesta no suficiente \$$initial_bet${endColour}"
        echo -e "${yellowColour}[+] Han habido un total de $play_count jugadas${endColour}"
        echo -e "${yellowColour}[+] A continuacion se van a representar las jugadas malas consecutivas que han salido: ${endColour}"
        echo -e "${blueColour}$jugadas_malas${endColour}\n"
        tput cnorm; exit 0
      fi
    else
      echo -e "\n${redColour}[!] Te has quedado sin dinero!!!${endColour}\n"
      echo -e "${yellowColour}[+] Han habido un total de $play_count jugadas${endColour}"
      echo -e "${yellowColour}[+] A continuacion se van a representar las jugadas malas consecutivas que han salido: ${endColour}"
      echo -e "${blueColour}$jugadas_malas${endColour}\n"
      tput cnorm; exit 0
    fi

    let play_count+=1
  done
  tput cnorm # Mostrar el cursor en consola
}

function inverseLabouchere(){
  echo -e "\n${purpleColour}[+] Tu dinero actual : \$$money"
  echo -ne "${purpleColour}[+] A que deseas apostar continuamente? (Par\Impar) -> ${endColour}" && read par_impar

  declare -a my_sequence=(1 2 3 4)
  echo -e "\n[+] Comenzamos con la secuencia [${my_sequence[@]}]"

  bet=$((${my_sequence[0]} + ${my_sequence[-1]}))
  play_count=1

  tput civis
  while true; do
    random_number="$(($RANDOM % 37))"
    money=$(($money-$bet))   
    echo -e "\n${purpleColour}[+] Ha salido el numero $random_number${endColour}"
    echo -e "${purpleColour}[+] Invertimos \$$bet${endColour}"
    echo -e "[+] Tenemos \$$money"

    if [ ! "$money" -le 0 ]; then
      if [ "$par_impar" == "par" ]; then
        if [ "$(($random_number % 2))" -eq 0 ]; then
          if [ "$random_number" -eq 0 ]; then
            echo -e "[!] Ha salido el 0, PIERDES!"
            unset my_sequence[0]
            unset my_sequence[-1] 2>/dev/null
            my_sequence=(${my_sequence[@]})
            echo -e "[+] La secuencia se nos queda de la siguiente manera: [${my_sequence[@]}]"
            if [ "${#my_sequence[@]}" -ne 1 ] && [ "${#my_sequence[@]}" -ne 0 ]; then
              bet=$((${my_sequence[0]} + ${my_sequence[-1]}))
            elif [ "${#my_sequence[@]}" -eq 1 ]; then
              bet=${my_sequence[0]}
            else
              echo -e "${redColour}[!] Hemos perdido nuestra secuencia${endColour}"
              my_sequence=(1 2 3 4)
              echo -e "${yellowColour}[+] Restablecemos la secuencia a [${my_sequence[@]}]${endColour}"
              bet=$((${my_sequence[0]} + ${my_sequence[-1]}))
            fi
          else
            echo -e "[+] El numero que ha salido es PAR, GANAS!"
            reward=$(($bet*2))
            let money+=$reward
            echo -e "${yellowColour}[+] Tienes \$$money${endColour}"

            my_sequence+=($bet)
            my_sequence=(${my_sequence[@]})
            echo -e "[+] Nuestra nueva secuencia es: [${my_sequence[@]}]"
            if [ "${#my_sequence[@]}" -ne 1 ] && [ "${#my_sequence[@]}" -ne 0 ]; then
              bet=$((${my_sequence[0]} + ${my_sequence[-1]}))
            elif [ "${#my_sequence[@]}" -eq 1 ]; then
              bet=${my_sequence[0]}
            else
              echo -e "${redColour}[!] Hemos perdido nuestra secuencia${endColour}"
              my_sequence=(1 2 3 4)
              echo -e "${yellowColour}[+] Restablecemos la secuencia a [${my_sequence[@]}]${endColour}"
              bet=$((${my_sequence[0]} + ${my_sequence[-1]}))
            fi

          fi
        else
          echo -e "[!] El numero que ha salido es IMPAR, PIERDES!"
          unset my_sequence[0]
          unset my_sequence[-1] 2>/dev/null
          my_sequence=(${my_sequence[@]})
          echo -e "[+] La secuencia se nos queda de la siguiente manera: [${my_sequence[@]}]"
          if [ "${#my_sequence[@]}" -ne 1 ] && [ "${#my_sequence[@]}" -ne 0 ]; then
            bet=$((${my_sequence[0]} + ${my_sequence[-1]}))
          elif [ "${#my_sequence[@]}" -eq 1 ]; then
            bet=${my_sequence[0]}
          else
            echo -e "${redColour}[!] Hemos perdido nuestra secuencia${endColour}"
            my_sequence=(1 2 3 4)
            echo -e "${yellowColour}[+] Restablecemos la secuencia a [${my_sequence[@]}]${endColour}"
            bet=$((${my_sequence[0]} + ${my_sequence[-1]}))
          fi

        fi 
      elif [ "$par_impar" == "impar" ]; then
        if [ "$(($random_number % 2))" -eq 0 ]; then
          if [ "$random_number" -eq 0 ]; then
            echo -e "[!] Ha salido 0, PIERDES!"
            unset my_sequence[0]
            unset my_sequence[-1] 2>/dev/null
            my_sequence=(${my_sequence[@]})
            echo -e "[+] La secuencia se nos queda de la siguiente manera: [${my_sequence[@]}]"
            if [ "${#my_sequence[@]}" -ne 1 ] && [ "${#my_sequence[@]}" -ne 0 ]; then
              bet=$((${my_sequence[0]} + ${my_sequence[-1]}))
            elif [ "${#my_sequence[@]}" -eq 1 ]; then
              bet=${my_sequence[0]}
            else
              echo -e "${redColour}[!] Hemos perdido nuestra secuencia${endColour}"
              my_sequence=(1 2 3 4)
              echo -e "${yellowColour}[+] Restablecemos la secuencia a [${my_sequence[@]}]${endColour}"
              bet=$((${my_sequence[0]} + ${my_sequence[-1]}))
            fi
          else
            echo -e "[!] El numero que ha salido es PAR, PIERDES!"
            unset my_sequence[0]
            unset my_sequence[-1] 2>/dev/null
            my_sequence=(${my_sequence[@]})
            echo -e "[+] La secuencia se nos queda de la siguiente manera: [${my_sequence[@]}]"
            if [ "${#my_sequence[@]}" -ne 1 ] && [ "${#my_sequence[@]}" -ne 0 ]; then
              bet=$((${my_sequence[0]} + ${my_sequence[-1]}))
            elif [ "${#my_sequence[@]}" -eq 1 ]; then
              bet=${my_sequence[0]}
            else
              echo -e "${redColour}[!] Hemos perdido nuestra secuencia${endColour}"
              my_sequence=(1 2 3 4)
              echo -e "${yellowColour}[+] Restablecemos la secuencia a [${my_sequence[@]}]${endColour}"
              bet=$((${my_sequence[0]} + ${my_sequence[-1]}))
            fi
          fi
        else
          echo -e "[+] El numero que ha salido es IMPAR, GANAS!"
          reward=$(($bet*2))
          let money+=$reward
          echo -e "${yellowColour}[+] Tienes \$$money${endColour}"

          my_sequence+=($bet)
          my_sequence=(${my_sequence[@]})
          echo -e "[+] Nuestra nueva secuencia es: [${my_sequence[@]}]"
          if [ "${#my_sequence[@]}" -ne 1 ] && [ "${#my_sequence[@]}" -ne 0 ]; then
            bet=$((${my_sequence[0]} + ${my_sequence[-1]}))
          elif [ "${#my_sequence[@]}" -eq 1 ]; then
            bet=${my_sequence[0]}
          else
            echo -e "${redColour}[!] Hemos perdido nuestra secuencia${endColour}"
            my_sequence=(1 2 3 4)
            echo -e "${yellowColour}[+] Restablecemos la secuencia a [${my_sequence[@]}]${endColour}"
            bet=$((${my_sequence[0]} + ${my_sequence[-1]}))
          fi
        fi
      else
        echo -e "\n${redColour}[!] No tienes dinero para seguir con la apuesta!!!${endColour}"
        echo -e "${yellowColour}[+] Dinero actual \$$money y apuesta no suficiente \$$initial_bet${endColour}"
        echo -e "${yellowColour}[+] Han habido un total de $play_count jugadas${endColour}"
        tput cnorm; exit 0
      fi
    else
      echo -e "\n${redColour}[!] Te has quedado sin dinero!!!${endColour}"
      echo -e "${yellowColour}[+] Han habido un total de $play_count jugadas${endColour}"
      tput cnorm; exit 0
    fi
    let play_count+=1
    sleep 3
  done
  tput cnorm
}

while getopts "m:t:h" arg; do
  case $arg in
    m) money=$OPTARG;;
    t) technique=$OPTARG;;
    h) helpPanel;;
  esac
done

if [ $money ] && [ $technique ]; then
  if [ $technique == "martingala" ]; then
    martingala
  elif [ $technique == "inverseLabouchere" ]; then
    inverseLabouchere
  else
    echo -e "\n${redColour}[!] Tecnica ingresada no existe ...${endColour}\n"
    helpPanel
  fi
else
  helpPanel
fi

