┌─[✗]─[root@parrot]─[/home/user]
└──╼ #__chown__ pepe:pepe testing
┌─[root@parrot]─[/home/user]
└──╼ #ls -l
total 0
drwx------ 1 user user 52 Jul 17 01:02 Desktop
drwxr-xr-x 1 user user  0 Jul 16 22:44 Documents
drwxr-xr-x 1 user user  0 Jul 16 22:44 Downloads
drwxr-xr-x 1 user user  0 Jul 16 22:44 Music
drwxr-xr-x 1 user user  0 Jul 16 22:44 Pictures
drwxr-xr-x 1 user user  0 Jul 16 22:44 Public
drwx------ 1 user user 22 Jul  7 12:20 Templates
drwxr-xr-x 1 user user  0 Jul 16 22:44 Videos
drwxrwxrwx 1 __pepe pepe__  0 Jul 18 19:27 testing
----

┌─[pepe@parrot]─[/home/user/testing]
└──╼ $echo Hola probando > file.txt
┌─[pepe@parrot]─[/home/user/testing]
└──╼ $ls
file.txt

al tener todos los permisos, con user puedo eliminar el archivo
┌─[user@parrot]─[~/testing]
└──╼ $rm file.txt => *AL COLOCAR UN -f NO NECESITA CONFIRMACIÓN !!!!*
rm: remove write-protected regular file 'file.txt'? y
┌─[user@parrot]─[~/testing]
└──╼ $ls
----

se vuelve a crer un archivo:
┌─[pepe@parrot]─[/home/user/testing]
└──╼ $echo goool > file.txt
┌─[pepe@parrot]─[/home/user/testing]
└──╼ $ls
file.txt
┌─[pepe@parrot]─[/home/user/testing]
└──╼ $cd ..
┌─[pepe@parrot]─[/home/user]
└──╼ $ls
Desktop  Documents  Downloads  Music  Pictures  Public  Templates  Videos  testing
----

Pero se agrega : __chmod +t a la carpeta__ PARA COLOCAR EL STICKY BIT
┌─[✗]─[pepe@parrot]─[/home/user]
└──╼ $chmod +t testing
----

┌─[pepe@parrot]─[/home/user]
└──╼ $su user
Password: 
┌─[user@parrot]─[~]
└──╼ $cd testing
┌─[user@parrot]─[~/testing]
└──╼ $ls
file.txt
┌─[user@parrot]─[~/testing]
└──╼ $ls -l
total 4
-rw-r--r-- 1 pepe pepe 6 Jul 19 04:38 file.txt

__ahora no lo puede borrar__
