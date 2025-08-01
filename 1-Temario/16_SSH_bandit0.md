sshpass -p 'bandit0' ssh bandit0@bandit.labs.overthewire.org -p 2220 *bandit0*

# acceso remoto a la comunicación que esta cifrada !!!
    export TERM=xterm __PARA QUE FUNCIONE CTL+D__
    passwd: ZjLjTmM6FvvyRnrb2rfNWOZOTa6ip5If

sshpass -p 'ZjLjTmM6FvvyRnrb2rfNWOZOTa6ip5If' ssh bandit1@bandit.labs.overthewire.org -p 2220 *bandit1*

# Archivos con nombre ' - '
CAT no te deja hacer cat - ya q piensa que esta invocando una accion
por lo que se debe
cat 'directorio en donde se encuentra'

    cat /home/bandit1/-
    cat /home/bandit1/*
    cat ./-
    cat $(pwd)/-
    grep -r "\w" 2>/dev/null
        grep -r "\w" 2>/dev/null | tail -n 1
        grep -r "\w" 2>/dev/null | tail -n 1 | awk '{print $2}' FS=":"
        grep -r "\w" 2>/dev/null | tail -n 1 | cut -d ':' -f 2
        grep -r "\w" 2>/dev/null | tail -n 1 | tr ':' ' ' |awk 'NF{print $NF}'

    passwd: 263JGJPfgU6LtdEvgfWU1XP5yac29mFx

sshpass -p '263JGJPfgU6LtdEvgfWU1XP5yac29mFx' ssh bandit2@bandit.labs.overthewire.org -p 2220 *bandit2*

# Archivo que tiene espacios ' '
Al realizar CAT con archivos nombres separados, piensa que son archivos distintos e intenta abrir cada uno de ellos, sin saber que se tratase de un nombre COMPLETO !!!
   
    cat "spaces in this filename"
    cat spaces\ in\ this\ filename --> AL REALIZAR cat s[TAB] y autocompleta
    cat s*

    passwd: MNk8KNH3Usiio41PRUEoDFPqfxLPlSmx

sshpass -p 'MNk8KNH3Usiio41PRUEoDFPqfxLPlSmx' ssh bandit3@bandit.labs.overthewire.org -p 2220 *bandit3*

# Archivo gruardado en un directorio oculto => ls -la => drwxr-xr-x  2 root root 4096 Apr 10 14:23 inhere
    ls -la
    find .
    file ...Hiding-From-You
    cat ...Hiding-From-You

    find . -type f | grep -vE "bashrc|profile|logout" | xargs cat
    - La E es para no mostrar lo que tenga a continuación

    passwd: 2WmrDFRmJIq3IPxneAaMGhap0pFhF3NJ

sshpass -p '2WmrDFRmJIq3IPxneAaMGhap0pFhF3NJ' ssh bandit4@bandit.labs.overthewire.org -p 2220 *bandit4*

# Archivos NO legibles
    find . -type f | grep "\-file" | xargs file
    cat ./inhere/-file07

    passwd: 4oQYVPkxZOOEOO5pTW81FB8j8lxXGUQw

sshpass -p '4oQYVPkxZOOEOO5pTW81FB8j8lxXGUQw' ssh bandit5@bandit.labs.overthewire.org -p 2220 *bandit5*

# Buscar un directorio pon propiedades : human-readable ; 1033 bytes in size ; not executable
# ESTO ES BUSQUEDA PRECISA DE ARCHIVOS
    man find => size => c para cantidad de bits
    find . -type f -readable ! -executable -size 1033c | xargs cat
    find . -type f ! -executable -size 1033c | xargs cat | head -n 1

    passwd: HWasnPhtq9AVKe0dmk45nxy20cvUa6EG

sshpass -p 'HWasnPhtq9AVKe0dmk45nxy20cvUa6EG' ssh bandit6@bandit.labs.overthewire.org -p 2220 *bandit6*

# Encontrar por medio de user y group !
    cd / => irme a la raiz
    find . -type f -user bandit7 -group bandit6 -size 33c 2>/dev/null | xargs cat

    passwd: morbNTDkSW6jIlUc0ymOdMaLnOlFVAaj

sshpass -p 'morbNTDkSW6jIlUc0ymOdMaLnOlFVAaj' ssh bandit7@bandit.labs.overthewire.org -p 2220 *bandit7*

# Encontrar passwd dentro de un TXT con una palabra en especifico => millionth
    cat data.txt | grep "millionth"
    cat data.txt | grep "millionth" | awk 'NF{print $NF}' => quedarse con el ultimo argumento
    cat data.txt | grep "millionth" | awk 'NF{print $2}'
    cat data.txt | grep "millionth" | xargs | cut -d ' ' -f 2
    cat data.txt | grep "millionth" | rev | xargs | cut -d ' ' -f 1 | rev
    cat data.txt | grep "millionth" | xargs | tr ' ' '\n'

    ejmplo: echo"Hola esto es una prueba de prueba" |  sed 's/prueba/probando/g'
    ======> Hola esto es una probando de probando

    passwd: dfwvzFQi4mU0wfNbFOe9RoWskMLg7eEc

sshpass -p 'dfwvzFQi4mU0wfNbFOe9RoWskMLg7eEc' ssh bandit8@bandit.labs.overthewire.org -p 2220 *bandit8*

# Contraseña en data.txt y es una linea q se repite una unica vez
    sort data.txt | uniq -u => realiza un ordenamiento y lista el unico en la lista ordenada

    passwd: 4CKMh1JI91bUIZZPXDqGanal4xvAg0JM

sshpass -p '4CKMh1JI91bUIZZPXDqGanal4xvAg0JM' ssh bandit9@bandit.labs.overthewire.org -p 2220 *bandit9*

# La contraseña para el siguiente nivel se almacena en el archivo data.txt en una de las pocas cadenas legibles por humanos, precedida por varios caracteres ‘=’.
    strings => cadena de caracteres imprimibles
    strings data.txt | grep "==="
    strings data.txt | grep "===" | tail -n 1 => quedarse con la ultima linea
    strings data.txt | grep "===" | tail -n 1 | awk 'NF{print $NF}'

    passwd: FGUW5ilLVJrxX9kMYMmlN4MgbpfMiqey

sshpass -p 'FGUW5ilLVJrxX9kMYMmlN4MgbpfMiqey' ssh bandit10@bandit.labs.overthewire.org -p 2220 *bandit10*

# Passwd almacenada en txt encriptada en base64
## BASE64 : 64 como base, potencia mayor caracteres ASCII
    echo "hola" | base64 => te la crea a base64
        indicar base64 -w 0 => muestra todo en una sola linea.
    echo "4HJ543HJJH234J5G2" | base64 -d => decodifica la cadena mostrando el original

    cat data.txt | base64 -d
    cat data.txt | base64 -d | awk 'NF{print $NF}'

    passwd: dtR173fZKb0RRsDFSGsg2RWnpNVj3qRr

sshpass -p 'dtR173fZKb0RRsDFSGsg2RWnpNVj3qRr' ssh bandit11@bandit.labs.overthewire.org -p 2220 *bandit11*

# La contraseña para el siguiente nivel se almacena en el archivo data.txt, donde todas las letras minúsculas (a-z) y mayúsculas (A-Z) se han rotado 13 posiciones.
## ROT 13
    cat data.txt
        Gur cnffjbeq vf 7k16JArUVv5LxVuJfsSVdbbtaHGlw9D4
    APLICANDO ROT13 : The password is 7x16WNeHIi5YkIhWsfFIqoognUTyj9Q4
    
    cat data.txt | tr '[A-Za-z]' '[N-ZA-Mn-za-m]' | awk 'NF{print $NF}'

    passwd: 7x16WNeHIi5YkIhWsfFIqoognUTyj9Q4

sshpass -p '7x16WNeHIi5YkIhWsfFIqoognUTyj9Q4' ssh bandit12@bandit.labs.overthewire.org -p 2220 *bandit12*

# La contraseña para el siguiente nivel se almacena en el archivo data.txt, que es un volcado hexadecimal de un archivo comprimido repetidamente. Para este nivel, puede ser útil crear un directorio en /tmp donde pueda trabajar. Use mkdir con un nombre de directorio difícil de adivinar. O mejor aún, use el comando "mktemp -d". Luego, copie el archivo de datos con cp y renómbrelo con mv (¡consulte las páginas del manual!).
- Esta en hexadecimal, hay que hacer el proceso INVERSO

00000000: 1f8b 0808 41d4 f767 0203 6461 7461 322e  ....A..g..data2.
00000010: 6269 6e00 0149 02b6 fd42 5a68 3931 4159  bin..I...BZh91AY
00000020: 2653 59a8 ffa7 8f00 001d 7fff dbeb 7ffa  &SY.............
00000030: bb7f a5ef bb7e f5fb fdff b7c7 f3ff ff7f  .....~..........
00000040: ff7f fff7 deba fdfa eff7 dddf b001 3b19  ..............;.
00000050: a200 d01a 0190 0034 0006 800d 0340 0346  .......4.....@.F
00000060: 8000 0340 0320 0069 a034 0640 0346 4680  ...@. .i.4.@.FF.
00000070: 68d1 a68c 8321 9313 4da4 f510 6406 8003  h....!..M...d...
00000080: 4006 9a00 000d 000d 0069 a007 a9a0 001a  @........i......
00000090: 1b50 03d4 01a6 9a1e a001 a343 4683 469a  .P.........CF.F.
000000a0: 3d40 001a 7a8d 01a0 074c 801e a1a6 8064  =@..z....L.....d
000000b0: 01a3 d434 00c4 0d00 000d 0001 a680 1a19  ...4............
000000c0: 0061 0f53 41a0 0000 0d00 341a 0320 0034  .a.SA.....4.. .4
000000d0: d1ea 0168 4882 8244 0130 5550 f16b f52e  ...hH..D.0UP.k..
000000e0: a322 cb9f bb8c aaf6 e244 cc70 b151 47c8  .".......D.p.QG.
000000f0: 6c03 a3ae 4a81 1ee0 03ce 840e a978 2046  l...J........x F
00000100: 630b 4b0d 9883 7078 e7e8 5bfb 68f1 f685  c.K...px..[.h...
00000110: 6f46 771c 3920 449f f0cb 39e2 0841 10b5  oFw.9 D...9..A..
00000120: 8714 e981 115c d1bc 2da4 318b 106c 904e  .....\..-.1..l.N
00000130: 9328 5e97 405a 4054 21db e049 1a32 5f3d  .(^.@Z@T!..I.2_=
00000140: 7069 408f f0a4 8ce5 fbea 282c 51d1 49e4  pi@.......(,Q.I.
00000150: d52f 0762 dd90 27b8 79d3 0499 52e0 060c  ./.b..'.y...R...
00000160: fd91 a474 d408 88f3 1fda d2d1 325a baeb  ...t........2Z..
00000170: bfe7 f0f6 cc3c 776d f369 e73c 47d4 66ea  .....<wm.i.<G.f.
00000180: 4b90 e404 03b3 6a09 4687 945d 09ef 706b  K.....j.F..]..pk
00000190: 8f82 2503 80d0 0a0a 3e60 f879 bf02 2d42  ..%.....>`.y..-B
000001a0: bf37 9c96 4b22 585c 35c8 3cf1 da9f 518b  .7..K"X\5.<...Q.
000001b0: ccd5 a68c 9647 aa38 8a50 89d2 f89c 1ff0  .....G.8.P......
000001c0: 1042 18c3 6549 400d fe17 ec74 3171 6d74  .B..eI@....t1qmt
000001d0: a8bb 0def f11a 5a69 0e70 aa34 0037 b180  ......Zi.p.4.7..
000001e0: 1540 c4d2 0af7 e290 8784 ce9e 147a 6836  .@...........zh6
000001f0: 944b 3f18 2ba2 c620 af92 fb01 184f 3def  .K?.+.. .....O=.
00000200: 1b7d 0162 733d adca 90ac 7142 8319 f703  .}.bs=....qB....
00000210: 5930 69e2 8320 9110 5d63 0db9 9294 d4ef  Y0i.. ..]c......
00000220: 50b9 5907 0924 92c1 014e a284 25ce a6ef  P.Y..$...N..%...
00000230: 67b2 4e06 6d21 4136 2ac0 292d 6638 033c  g.N.m!A6*.)-f8.<
00000240: 21af be4e 13bb b74f 2c10 18c7 eea3 c436  !..N...O,......6
00000250: c988 05e6 5638 1ff1 7724 5385 090a 8ffa  ....V8..w$S.....
00000260: 78f0 d951 192d 4902 0000                 x..Q.-I...

    midkir temp
    cat data => Ctl+V del archivo anterior
    cat data | xxd -r | sponge data => se guarda el reverse
    file data
        data: gzip compressed data, was "data2.bin", last modified: Thu Apr 10 14:22:57 2025, max compression, from Unix, original size modulo 2^32 585 => ARCHIVO COMPRIMIDO
    mv data data.gz
    7z l data.gz => (o gunzip, pero es mejor 7z)
    yz x data.gz => con X siempre se va a poder extraer. => data2.bin (otro comprimido)

    data.gz  data2  data2.bin  data4.bin  data5.bin  data6  data6.bin  data8.bin
    -> Abra que hacer 7z x a cada uno de ellos hasta llegar a data9.bin NO es TAR sino ASCII Text

    cat !$ => Hace la referencia del ultimo ARGUMENTO referenciado (antes: file__ data9.bin__)
    cat data9.bin | awk 'NF{print $NF}'
    cat !$ | awk 'NF{print $NF}'

    passwd: FO5dwFsc0cbaIiH0h8J2eUks2vdTDwAn

sshpass -p 'FO5dwFsc0cbaIiH0h8J2eUks2vdTDwAn' ssh bandit13@bandit.labs.overthewire.org -p 2220 *bandit13*

- Ahora en formato AUTOMATIZADO CON BASH -> UTILIZANDO NVIM
#!/bin/bash

function ctrl_c(){
    echo -e "\n\n[!] Saliendo...\n"
}
#Ctrl+C
trap ctrl_c INT
sleep 10

primer_archivo = "data.gz"
echo "El archivo es: $primer_archivo"
decompreser_file_name="$(7z l data.gz | tail -n 3 | awk 'NF{print $NF}')"
7z x $primer_archivo &>/dev/null$

while [$decompreser_file_name]; do
    echo -e "\n[*] Nuevo archivo descomprimido: $descompreser_file_name"
    7z x $descompreser_file_name &>/dev/null
    descompreser_file_name ="$(7z; $descompreser_file_name 2>/dev/null | tail -n 3 | awk 'NF(print $NF)'
done

# La contraseña para el siguiente nivel se almacena en /etc/bandit_pass/bandit14 y solo puede ser leída por el usuario bandit14. Para este nivel, no se obtiene la siguiente contraseña, sino una clave SSH privada que permite iniciar sesión en el siguiente nivel. Nota: localhost es un nombre de host que se refiere a la máquina en la que se está trabajando.
- Dentro de cd .ssh (instalado ssh o openssh)
    sudo systemctl start sshd => d 

    ssh-keygen -> crea una clave prublica y privada! ESTO SE HACE EN: /root/.ssh/
        id_ed25519          => Clave Privada !
        id_ed25519.pub      => Clave Publica !

    cp id_ed25519.pub authorized_keys => transforma la clave publica en clave autorizada
        => no va a pedir contra.
        => lado remoto, conectarse a otra maquina sin contra...
        => en el otro compu o maquina, debe de tener la copia llamada authorized_keys en su dominio. SIOSI

- O lo otro es hacer autorizada la clave privada para conectarse como se conecta banditX con el sshpass -p [\...]

    ssh-copy-id -i id_ed25519 user@localhost => hace que la clave privada de convierta en una clave autorizada.

Ahora devuelta a bandit:
    ssh -i sshkey.private bandit14@localhost -p 2220
    whoami => bandit14
    cat /etc/bandit_pass/bandit14

    passwd: MU4VWeTyJk8ROof1qqmcBPaLh7lDCPvS

sshpass -p 'MU4VWeTyJk8ROof1qqmcBPaLh7lDCPvS' ssh bandit14@bandit.labs.overthewire.org -p 2220 *bandit14*

# La contraseña para el siguiente nivel se puede recuperar enviando la contraseña del nivel actual al puerto 30000 en localhost.
    nc => netcat : escucha por un puerto y recibe la consulta por consola.
    Netcat es una herramienta de red que permite a través de intérprete de comandos y con una sintaxis sencilla abrir puertos TCP/UDP en un HOST, asociar una shell a un puerto en concreto y forzar conexiones UDP/TCP.

    netstat -nat => para ver puertos abiertos
    ss -nltp => otra manera de ver puertos abiertos o LISTEN

    bandit14@bandit:~$ nc localhost 30000
        MU4VWeTyJk8ROof1qqmcBPaLh7lDCPvS
        Correct!
        8xCjnmgoKbGLhHFAZlGE5Tmu4M2tKJQo

    passwd: 8xCjnmgoKbGLhHFAZlGE5Tmu4M2tKJQo

sshpass -p '8xCjnmgoKbGLhHFAZlGE5Tmu4M2tKJQo' ssh bandit15@bandit.labs.overthewire.org -p 2220 *bandit15*

# La contraseña del siguiente nivel se puede recuperar enviando la contraseña del nivel actual al puerto 30001 del host local mediante cifrado SSL/TLS.
## Nota útil: ¿Está obteniendo "TERMINADO", "RENEGOCIANDO" o "ACTUALIZANDO"? Consulte la sección "COMANDOS CONECTADOS" en la página de manual.

- Manera de escuchar PUERTOS -\ PORT
    netstat -nat
    ss -nltp
    cat /proc/net/tcp

    which nc => Lista la ruta absoluta, si la detecta es pq existe el comando.
    which ncat => es como un NetCat y contiene parametros que "nc" no tiene : "ssl"

    ncat --ssl dirIP Port => permite realizar una conexion 
    ncat --ssl 127.0.0.1 30001
        8xCjnmgoKbGLhHFAZlGE5Tmu4M2tKJQo
        Correct!
        kSkvUpMQ7lBYyCM4GBPvCvT1BfWRy0D
\
    passwd: kSkvUpMQ7lBYyCM4GBPvCvT1BfWRy0Dx

sshpass -p 'kSkvUpMQ7lBYyCM4GBPvCvT1BfWRy0Dx' ssh bandit16@bandit.labs.overthewire.org -p 2220 *bandit16*

# Las credenciales para el siguiente nivel se pueden obtener enviando la contraseña del nivel actual a un puerto del host local en el rango 31000 a 32000. Primero, averigüe cuáles de estos puertos tienen un servidor escuchando. Luego, averigüe cuáles admiten SSL/TLS y cuáles no. Solo un servidor proporcionará las siguientes credenciales; los demás simplemente le devolverán lo que usted le envíe.
# Nota útil: ¿Está obteniendo "TERMINADO", "RENEGOCIANDO" o "ACTUALIZANDO"? Consulte la sección "COMANDOS CONECTADOS" en la página de manual.

    timeout 1 bash -c "ping -c 1 192.168.1.5 &>/dev/null" && echo "[+] El host esta activo" || echo "[+] El host no esta activo"
        Dice si esta activo o no, para que no se demore tanto se concatena un TIMEOUT al inicio. En caso de no responder en 1 segundo. Se cierra!!!! Normalmente no tarda tanto, lo da altoke!!!

### Para buscar port active en bash:
    #!/bin/bash

    function ctrl_c(){
        echo -e "\n\n[!] Saliendo...\n"
        tput cnorm
        exit 1
    }

    # Ctrl+C para Salir
    trap ctrl_c INT 

    # Ocultar el cursor
    tput civis 

    for port in $(seq 1 65535); do
        (echo '' > /dev/tpc/127.0.0.1/$port) 2>/dev/null && echo "[+] $port - OPEN" $
    done; wait

    # Recuperar el Cursor
    tput cnorm

- Ahora con el ejecicio en cuestion
    mktemp -d => crea directorio temporal

    #!/bin/bash

    function ctrl_c(){
        echo -e "\n\n[!] Saliendo...\n"
        exit 1
    }

    # Ctrl+C para Salir
    trap ctrl_c INT

    for port in $(seq 31000 32000); do
        (echo '' > /dev/tpc/127.0.0.1/$port) 2>/dev/null && echo "[+] $port - OPEN"
    done

- Utilizando NPMAP:
    nmap --open -T5 -v -n -p31000-32000 127.0.0.1
        PORT      STATE SERVICE
        31046/tcp open  unknown
        31518/tcp open  unknown
        31691/tcp open  unknown
        31790/tcp open  unknown
        31960/tcp open  unknown
    
    Ahora conectarse con NetCat : nc
    ncat --ssl 127.0.0.1 31046

kSkvUpMQ7lBYyCM4GBPvCvT1BfWRy0Dx
Correct!
-----BEGIN RSA PRIVATE KEY-----
MIIEogIBAAKCAQEAvmOkuifmMg6HL2YPIOjon6iWfbp7c3jx34YkYWqUH57SUdyJ
imZzeyGC0gtZPGujUSxiJSWI/oTqexh+cAMTSMlOJf7+BrJObArnxd9Y7YT2bRPQ
Ja6Lzb558YW3FZl87ORiO+rW4LCDCNd2lUvLE/GL2GWyuKN0K5iCd5TbtJzEkQTu
DSt2mcNn4rhAL+JFr56o4T6z8WWAW18BR6yGrMq7Q/kALHYW3OekePQAzL0VUYbW
JGTi65CxbCnzc/w4+mqQyvmzpWtMAzJTzAzQxNbkR2MBGySxDLrjg0LWN6sK7wNX
x0YVztz/zbIkPjfkU1jHS+9EbVNj+D1XFOJuaQIDAQABAoIBABagpxpM1aoLWfvD
KHcj10nqcoBc4oE11aFYQwik7xfW+24pRNuDE6SFthOar69jp5RlLwD1NhPx3iBl
J9nOM8OJ0VToum43UOS8YxF8WwhXriYGnc1sskbwpXOUDc9uX4+UESzH22P29ovd
d8WErY0gPxun8pbJLmxkAtWNhpMvfe0050vk9TL5wqbu9AlbssgTcCXkMQnPw9nC
YNN6DDP2lbcBrvgT9YCNL6C+ZKufD52yOQ9qOkwFTEQpjtF4uNtJom+asvlpmS8A
vLY9r60wYSvmZhNqBUrj7lyCtXMIu1kkd4w7F77k+DjHoAXyxcUp1DGL51sOmama
+TOWWgECgYEA8JtPxP0GRJ+IQkX262jM3dEIkza8ky5moIwUqYdsx0NxHgRRhORT
8c8hAuRBb2G82so8vUHk/fur85OEfc9TncnCY2crpoqsghifKLxrLgtT+qDpfZnx
SatLdt8GfQ85yA7hnWWJ2MxF3NaeSDm75Lsm+tBbAiyc9P2jGRNtMSkCgYEAypHd
HCctNi/FwjulhttFx/rHYKhLidZDFYeiE/v45bN4yFm8x7R/b0iE7KaszX+Exdvt
SghaTdcG0Knyw1bpJVyusavPzpaJMjdJ6tcFhVAbAjm7enCIvGCSx+X3l5SiWg0A
R57hJglezIiVjv3aGwHwvlZvtszK6zV6oXFAu0ECgYAbjo46T4hyP5tJi93V5HDi
Ttiek7xRVxUl+iU7rWkGAXFpMLFteQEsRr7PJ/lemmEY5eTDAFMLy9FL2m9oQWCg
R8VdwSk8r9FGLS+9aKcV5PI/WEKlwgXinB3OhYimtiG2Cg5JCqIZFHxD6MjEGOiu
L8ktHMPvodBwNsSBULpG0QKBgBAplTfC1HOnWiMGOU3KPwYWt0O6CdTkmJOmL8Ni
blh9elyZ9FsGxsgtRBXRsqXuz7wtsQAgLHxbdLq/ZJQ7YfzOKU4ZxEnabvXnvWkU
YOdjHdSOoKvDQNWu6ucyLRAWFuISeXw9a/9p7ftpxm0TSgyvmfLF2MIAEwyzRqaM
77pBAoGAMmjmIJdjp+Ez8duyn3ieo36yrttF5NSsJLAbxFpdlc1gvtGCWW+9Cq0b
dxviW8+TFVEBl1O4f7HVm6EpTscdDxU+bCXWkfjuRb7Dy9GOtt9JPsX8MBTakzh3
vBgsyi/sN3RqRBcGU40fOoZyfAMT8s1m/uYv52O6IgeuZ/ujbjY=
-----END RSA PRIVATE KEY-----

    Dentro de mktemp:
        nano id_rsa : copy paste de lo anterior.
        chmod 600 id_rsa => Para que solo el propietario pueda Leer y Manipular la Clave.

        ssh -i sshkey.private bandit14@localhost -p 2220
            bandit17@bandit:~$ ls -l /etc/bandit_pass/ => como estamos ahora en bandit17 lo listamos con cat

    passwd: EReVavePLFHtFlFsjn3hyzMlvSuSAcRD

sshpass -p 'EReVavePLFHtFlFsjn3hyzMlvSuSAcRD' ssh bandit17@bandit.labs.overthewire.org -p 2220 *bandit17*

# Hay dos archivos en el directorio de inicio: passwords.old y passwords.new. La contraseña para el siguiente nivel está en passwords.new y es la única línea que se ha cambiado entre passwords.old y passwords.new.
## NOTA: Si has resuelto este nivel y ves "¡Adiós!" al intentar iniciar sesión en bandit18, esto está relacionado con el siguiente nivel, bandit19.
    wc -l * => contea las lineas de cada archivo

    diff passwords.old passwords.new
    < C6XNBdYOkgt5ARXESMKWWOUwBeaIQZ0Y => se a quitado
    ---
    > x2gLTTjFwMOhQ8oWNbMN362QKxfRqGlO => se a agregado

    passwd: x2gLTTjFwMOhQ8oWNbMN362QKxfRqGlO

sshpass -p 'x2gLTTjFwMOhQ8oWNbMN362QKxfRqGlO' ssh bandit18@bandit.labs.overthewire.org -p 2220 *bandit18*

# La contraseña para el siguiente nivel se almacena en un archivo "readme" en el directorio personal. Lamentablemente, alguien modificó el archivo .bashrc para cerrar sesión al iniciar sesión con SSH.

sshpass -p 'x2gLTTjFwMOhQ8oWNbMN362QKxfRqGlO' ssh bandit18@bandit.labs.overthewire.org -p 2220 bash
    Se añade un bash al final para acceder a este formato!!!

    whoami
        bandit18
    ls
        readme
    cat readme
        cGWpMaKXVwDUNgPAVJbWYuGHVn9zl3j8
    
    passwd: cGWpMaKXVwDUNgPAVJbWYuGHVn9zl3j8

sshpass -p 'cGWpMaKXVwDUNgPAVJbWYuGHVn9zl3j8' ssh bandit19@bandit.labs.overthewire.org -p 2220 *bandit19*

# Para acceder al siguiente nivel, debe usar el binario setuid en el directorio personal. Ejecútelo sin argumentos para saber cómo usarlo. La contraseña para este nivel se encuentra en el directorio habitual (/etc/bandit_pass), después de usar el binario setuid.
Podemos correr el comando como otro usuario
    ./bandit20-do bash -p => p para que atienda como el propietario !!!
    bash-5.2$ cat /etc/bandit_pass/bandit20

    passwd: 0qXahG8ZjOVMN9Ghs7iOWsCfZyXOUbYO

sshpass -p '0qXahG8ZjOVMN9Ghs7iOWsCfZyXOUbYO' ssh bandit20@bandit.labs.overthewire.org -p 2220 *bandit20*

# Hay un binario setuid en el directorio personal que realiza lo siguiente: establece una conexión con localhost en el puerto especificado como argumento de línea de comandos. Luego, lee una línea de texto de la conexión y la compara con la contraseña del nivel anterior (bandit20). Si la contraseña es correcta, transmite la contraseña del siguiente nivel (bandit21).
## NOTA: Intenta conectarte a tu propio demonio de red para comprobar si funciona como esperas.
Abrir un puerto con NetCat temporal !!!!:
    nc -nlvp 4646 => n: no quiero resolucion DNS, v vervose. p puerto. l listen mode
    ./suconnect 4646
- Terminal suconnect:
    bandit20@bandit:~$ ./suconnect 4646
    Read: 0qXahG8ZjOVMN9Ghs7iOWsCfZyXOUbYO
    Password matches, sending next password

- Terminal que activa el puerto:
    bandit20@bandit:~$ nc -nlvp 4646
    Listening on 0.0.0.0 4646
    Connection received on 127.0.0.1 54116
    0qXahG8ZjOVMN9Ghs7iOWsCfZyXOUbYO => Esta se le ingresa (contra de bandit20)
    EeoULMCra2q0dSkYj561DX7s1CpBuOBt => Recibe la passwd de bandit21

passwd: EeoULMCra2q0dSkYj561DX7s1CpBuOBt

sshpass -p 'EeoULMCra2q0dSkYj561DX7s1CpBuOBt' ssh bandit21@bandit.labs.overthewire.org -p 2220 *bandit21*

# Un programa se ejecuta automáticamente a intervalos regulares desde cron, el programador de tareas basado en tiempo. Busque la configuración en /etc/cron.d/ y vea qué comando se está ejecutando.
## CRON : tareas ejecutan en el sistema en INTERVALOS REGULARES DE TIEMPO !!!
    cd /etc/cron.d/
    cat cronjob_bandit22
        @reboot bandit22 /usr/bin/cronjob_bandit22.sh &> /dev/null
        * * * * * bandit22 /usr/bin/cronjob_bandit22.sh &> /dev/null => __EL TENER ESTOS ASTERIZCOS ES QUE SE EJECUTAN EN CADA MOMENTO__
- Suponiendo que el servicio CRON esta habilitado. El usuario bandit22, esta ejecutando: /usr/bin/cronjob_bandit22.sh
    cat /usr/bin/cronjob_bandit22.sh
        #!/bin/bash
        chmod 644 /tmp/t7O6lds9S0RqQh9aMcz6ShpAoZKF7fgv => ASIGNA PRIVILEGIO A ESTA RUTA
        cat /etc/bandit_pass/bandit22 > /tmp/t7O6lds9S0RqQh9aMcz6ShpAoZKF7fgv => REALIZA UN CAT
    cat /tmp/t7O6lds9S0RqQh9aMcz6ShpAoZKF7fgv
        tRae0UfB9v0UzbCdn9cY0gQnds9GF58Q

passwd: tRae0UfB9v0UzbCdn9cY0gQnds9GF58Q

sshpass -p 'tRae0UfB9v0UzbCdn9cY0gQnds9GF58Q' ssh bandit22@bandit.labs.overthewire.org -p 2220 *bandit22*

# Un programa se ejecuta automáticamente a intervalos regulares desde cron, el programador de tareas basado en tiempo. Busque la configuración en /etc/cron.d/ y vea qué comando se está ejecutando.
## NOTA: Consultar scripts de shell escritos por otros usuarios es una habilidad muy útil. El script para este nivel está diseñado para facilitar su lectura. Si tiene problemas para comprender su función, intente ejecutarlo para ver la información de depuración que muestra.
    cd /etc/cron.d/
    cat cronjob_bandit23 => /usr/bin/cronjob_bandit23.sh
    cat /usr/bin/cronjob_bandit23.sh
        #!/bin/bash

        myname=$(whoami)
        mytarget=$(echo I am user $myname | md5sum | cut -d ' ' -f 1) => ESTO ES LA CLAVE

        echo "Copying passwordfile /etc/bandit_pass/$myname to /tmp/$mytarget"

        cat /etc/bandit_pass/$myname > /tmp/$mytarget
        echo I am user bandit23 | md5sum | cut -d ' ' -f 1
            8ca319486bfbbc3663ea0fbe81326349 => ESTO ES LO QUE SE GUARDA EN MYTARGET

        POR LO TANTO: /tmp/$mytarget == /tmp/8ca319486bfbbc3663ea0fbe81326349

        cat /tmp/8ca319486bfbbc3663ea0fbe81326349

        passwd: 0Zf11ioIjMVN551jX3CmStKLYqjk54Ga

sshpass -p '0Zf11ioIjMVN551jX3CmStKLYqjk54Ga' ssh bandit23@bandit.labs.overthewire.org -p 2220 *bandit23*

# Un programa se ejecuta automáticamente a intervalos regulares desde cron, el programador de tareas basado en tiempo. Busque la configuración en /etc/cron.d/ y vea qué comando se está ejecutando.
## NOTA: Este nivel requiere que cree su primer script de shell. ¡Es un gran paso y debería estar orgulloso de sí mismo cuando lo supere!
## NOTA 2: Tenga en cuenta que su script de shell se elimina una vez ejecutado, así que le recomendamos guardar una copia.
    cd /etc/cron.d/
    cat cronjob_bandit24 => /usr/bin/cronjob_bandit24.sh
    cat /usr/bin/cronjob_bandit24.sh

    #!/bin/bash
    myname=$(whoami)

    cd /var/spool/$myname/foo => OJO
    echo "Executing and deleting all scripts in /var/spool/$myname/foo:"
    for i in * .*; => ir iterando en cada nombre de cada archivo.
    do
        if [ "$i" != "." -a "$i" != ".." ];
        then
            echo "Handling $i"
            owner="$(stat --format "%U" ./$i)" => se queda con el propietario creador del archivo
            if [ "${owner}" = "bandit23" ]; then
                timeout -s 9 60 ./$i => tarera aislada (ejecuta el archivo!!!)
            fi
            rm -f ./$i
        fi
    done

    cd /var/spool/bandit24/

    dir_name=$(mktemp -d)
    echo $dir_name => /tmp/tmp.btaQV4tx7d
    cd $dir_name => para ahorrarse de escribir anterior!!!! MAS COMODO  

    nano script.sh
    chmod +x script.sh
    chmod o+wx /tmp/tmp.btaQV4tx7d/
    '''
    #!/bin/bash
    cat /etc/bandit_pass/bandit24 > /tmp/tmp.btaQV4tx7d/bandit24_password.org
    chmod o+r /tmp/tmp.btaQV4tx7d/bandit24_password.org
    '''
    cp script.sh /var/spool/bandit24/foo/example
    watch -n 1 ls -l

# Un demonio está escuchando en el puerto 30002 y te dará la contraseña de bandit25 si recibes la contraseña de bandit24 y un código PIN secreto de 4 dígitos. No hay forma de recuperar el código PIN excepto revisando las 10 000 combinaciones, lo que se conoce como fuerza bruta.
## No es necesario crear nuevas conexiones cada vez.
__Fuerza bruta aplicada a conexiones__
    for pin in {0000..9999}; do echo "0Zf11ioIjMVN551jX3CmStKLYqjk54Ga $pin"; done

    dir_name=$(mktemp -d)
    cd $dir_name
    for pin in {0000..9999}; do echo "0Zf11ioIjMVN551jX3CmStKLYqjk54Ga $pin"; done > combinations.txt

    cat combinatios.txt | nc localhost 30002 | grep -vE "Wrong|Pleace Enter"
        -V DICE QUE TODO LO QUE TENGA ESTA CADENA SE IGNORA!
     Y te entrega la pass!!!

# Iniciar sesión en bandit26 desde bandit25 debería ser bastante sencillo… El shell del usuario bandit26 no es /bin/bash, sino otro. Descubre qué es, cómo funciona y cómo salir de él.
## NOTA: Si usas Windows y sueles usar PowerShell para acceder a Bandit por SSH, se sabe que PowerShell causa problemas con la solución prevista a este nivel. Deberías usar el símbolo del sistema.
__Escapando del contexto de un comando__
    ssh -i bandit26.sshkey bandit26@localhost -> La conexión de Bandit26 te EXPULSA!

    cat /etc/passwd | grep bandit26 => /usr/bin/showtext => NO ES UNA BASH

- Para ver el MORE en su totalidad hay q hacer la ventana muy pequeña para alcarzar a ver un -MORE- (66%) aprox
    - Ahora que se aprecia esto, con el caracter V se accede a un modo mas visible del MORE
    - Con ESC+SHIFT+: => se le puede definir variables:
        :set shell=/bin/bash

        ahora al hacer enter y volver a hacer ESC+SHIFT+: => y escribir :shell se accedera a la bash, entrando a la bash se puede observar que hay dentro !!!!

    Ahora dentro de la bash : cat /etc/bandit_pass/bandit26 => TE ENTREGA LA PASSWD 

CABE DESTACAR QUE ESTA CLAVE NO SIRVE DE NADA YA QUE BANDIT26 NO ES UN BASH, SINO UN SHOWTEXT !!!!

# ¡Buen trabajo consiguiendo un caparazón! ¡Ahora date prisa y consigue la contraseña de bandit27!
    ls -l => bandit27-do

    ./bandit27-do cat /etc/bandit_pass/bandit27 => ENTREGA LA CLAVE DE BANDIT27

# Hay un repositorio Git en ssh://bandit27-git@localhost/home/bandit27-git/repo a través del puerto 2220. La contraseña del usuario bandit27-git es la misma que la del usuario bandit27.
## Clonar el repositorio y buscar la contraseña para el siguiente nivel.