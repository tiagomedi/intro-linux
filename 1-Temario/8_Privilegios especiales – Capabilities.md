# Capabilities : referencia capacidad, privilegio asignado a un binario para un acceso prioritario.
┌─[root@parrot]─[/home/user]
└──╼ #getcap -r / 2>/dev/null

Al tener una capabilities se puede hacer :
┌─[✗]─[root@parrot]─[/home/user]
└──╼ #

    python -c 'import os; os.system("/bin/sh")'

se accede a la shell, en este caso al sh.

para mas info: 
https://gtfobins.github.io/

¿Qué son las Linux Capabilities?: http://www.etl.it.uc3m.es/Linux_Capabilities