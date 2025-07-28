┌─[user@parrot]─[~/Desktop]
└──╼ $echo "adios" > file.txt
┌─[user@parrot]─[~/Desktop]
└──╼ $sudo cat file.txt
adios

----

┌─[✗]─[user@parrot]─[~/Desktop]
└──╼ $rm file.txt

----

┌─[user@parrot]─[~/Desktop]
└──╼ $nano file.txt
┌─[user@parrot]─[~/Desktop]
└──╼ $cat file.txt
Hola esto es un texto !!!

----

# :wq -> para salir de Vim o vi
┌─[✗]─[user@parrot]─[~/Desktop]
└──╼ $vi file.txt

----

┌─[✗]─[user@parrot]─[~/Desktop]
└──╼ $ls -l
total 12
-rwx------ 1 user user 2107 Jun 27 09:33 README.license
-rw-r--r-- 1 user user   35 Jul 17 00:41 file.txt
-rw-r--r-- 1 root root   74 Jul  7 14:13 password.txt

# __rw-r--r--__ : separa en 3 : -rw- | r-- | r--
- r : read
- w : write
- x : (si esta en un directorio, el que corresponda, puede atravesarlo, tiene un archivo ejecutable)\
 
__-rw- | r-- | r--__
-rw-                                         | r--                           | r--
el primero es el permiso del __propietario__ - el segundo permiso __grupos__ - permiso __otros__

- Propietario : permiso escritura y lectura
- Grupo : solo lectura
- Otros : otros pueden leer el archivo, otro miembro del equipo acceso al archivo !!! no aleta ni borra, solo lee.

----

# ??? Como asignar permisos????
┌─[user@parrot]─[~/Desktop]
└──╼ $ls -l /etc/passwd
-rw-r--r-- 1 root root 2812 Jul  7 14:57 /etc/passwd
┌─[user@parrot]─[~/Desktop]
└──╼ $whoami
user
