# id
# sudo su
# whoami : mostrar info del usuario actual. __Ruta Absoluta__

# cat /etc/group : mostrar el contenido del archivo. Con identificador del grupo.
/bin/cat

# echo hola : variable de entorno
# echo $PATH : lista todo los componentes. Por orden de prioridad lo encuentra. __Ruta Relativa__

/bin/cat /etc/group | grep "floppy" (ayuda a aplicar filtros)
## 19:floppy:x:25:tiago

----
----

# which : ayuda a saber la ruta Relativa del comando
## which whoami
si no existe:
# -v whoami : en caso q no exista, se tiene este comando.

# pwd : saber la ruta actual.
# ls : directorios listados.
# lsd : es como un ls pero con esteroides...

# ls -l : permisos mas detallados el listado y con mas información
# ls /bin/ : listar por rutas sin no estar en ella.

# directorio personal de usuario : echo $HOME

----
----

# cat /etc/passwd : este archivo muestra los usuarios a nivel de sistema, con el directorio principal, tipo de shell, ruta del dir personal del usuario.

# echo $SHELL : muestra la shell q utiliza : por ejemplo ZSH
## cat /etc/shells : muestra todas las shell existentes en el sistema.

----
----
ONE LINER

# whoami; ls
tambien puede ser && que solo se ejecuta si se ejecuta el anterior.
tambien el || en caso de que no se ejecute en anterior

# __$whoam 2>/dev/null__ : envia el error a null; se elimina hace que se desaparezca !!!!
    $ls -l /dev/null
    crw-rw-rw- 1 root root 1, 3 Jul 16 18:44 /dev/null

┌─[user@parrot]─[~]
└──╼ $cat /etc/hosts > /dev/null
┌─[user@parrot]─[~]
└──╼ $cat /etc/hosts > /dev/null 2>&1
┌─[user@parrot]─[~]
└──╼ $cat /etc/hots > /dev/null 2>&1

o

┌─[✗]─[user@parrot]─[~]
└──╼ $cat /etc/hots &> /dev/null

al realizar
┌─[✗]─[user@parrot]─[~]
└──╼ $sudo wireshark
aparece :
┌─[user@parrot]─[~]
└──╼ $sudo wireshark
 ** (wireshark:3177) 23:05:03.906743 [GUI WARNING] -- QStandardPaths: XDG_RUNTIME_DIR not set, defaulting to '/tmp/runtime-root'

__solo necesito que lo ejecute pero no me muestre el output__::
┌─[✗]─[user@parrot]─[~]
└──╼ $sudo wireshark &>/dev/null & disown
[2] 3426 -> este es el pid un valor identificativo del proceso en particular, cada proceso tiene su identificador unico.
[1]   Done   sudo wireshark &> /dev/null
__esto hace q se ejecute en segundo plano !!!__