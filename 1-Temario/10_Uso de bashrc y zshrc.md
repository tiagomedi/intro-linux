# ls -la
l = lista de archivo y sus permisos

┌─[user@parrot]─[~]
└──╼ $nano .bashrc
└──╼ $nano .zshrc => **al tener instalado ZSH**

┌─[user@parrot]─[~]
└──╼ $nano ~/.bashrc => __LLAMARLA EN CUALQUIER DIRECTORIO__

┌─[user@parrot]─[~] *Para ver la IP*
└──╼ $hostname -I
172.16.222.130 

┌─[user@parrot]─[~]
└──╼ $hostname -I | awk '{print$1}' __Solo extraigo el primero__
172.16.222.130

┌─[✗]─[user@parrot]─[~]
└──╼ $hostname -I | cut -d ' ' -f 1 __Por espacios y filtro el primero__
172.16.222.130

┌─[user@parrot]─[~]
└──╼ $echo "Tu IP privada es: $(hostname -I | awk '{print $1}')" __Sustituye como cadena__
Tu IP privada es: 172.16.222.130

RETOCAR ZSH O BASH AYUDA A QUE SEA MAS RAPIDO EL RECONOCIMIENTO O FUNCIONES INMEDIATAS !!!
- DEFINIR FUNCIONES
- EMPLEAR FUNCIONER PARA PARCEAR DATOS
- RECONOCIMIENTO
- FILTRAR POR COSAS INTERESANTES