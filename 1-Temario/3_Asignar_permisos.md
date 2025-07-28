# su user : para migrar a otro usuario, En root no pedira contraseñas.
┌─[root@parrot]─[/home/user]
└──╼ #chmod o+w pp
# Otros tienen acceso a Write
drwxr-xrwx 1 root root  0 Jul 17 01:25 pp

┌─[root@parrot]─[/home/user]
└──╼ #su user
┌─[user@parrot]─[~]
└──╼ $ls
Desktop  Documents  Downloads  Music  Pictures  Public  Templates  Videos  pp
┌─[user@parrot]─[~]
└──╼ $cd pp
┌─[user@parrot]─[~/pp]
└──╼ $mkdir test
┌─[user@parrot]─[~/pp]
└──╼ $ls
test
┌─[user@parrot]─[~/pp]
└──╼ $touch pp.txt
┌─[user@parrot]─[~/pp]
└──╼ $ls
pp.txt  test
┌─[user@parrot]─[~/pp]
└──╼ $cd ..
┌─[user@parrot]─[~]
└──╼ $exit
exit

# Ahora User puede crear carpetas y documentos !!!!

----

┌─[root@parrot]─[/home/user]
└──╼ #chmod o+w pp  -----> AQUI SE LE AÑADIO PERMISO DE ESCRIBIR
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
__drwxr-xrwx 1 root root  0 Jul 17 01:30 pp__
┌─[root@parrot]─[/home/user]
└──╼ #chmod o-w pp  -----> AQUI SE LE QUITO EL PERMISO DE ESCRIBIR
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
__drwxr-xr-x 1 root root  0 Jul 17 01:30 pp__

----

┌─[✗]─[root@parrot]─[/home/user]
└──╼ #chgrp user pp   -----> AÑADE GRUPO EN ESTE CASO ES USER
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
drwxr-xr-x 1 root user  0 Jul 17 01:30 pp

┌─[✗]─[root@parrot]─[/home/user]
└──╼ #chmod g+w pp    ------> AÑADE PERMIDO DE ESCRITURA A LOS GRUPOS
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
drwxrwxr-x 1 root user  0 Jul 17 01:30 pp

# p : es el propietario (u)
# g : grupo (g)
# o : otros (o)

# __chmod u-x,g-rx, o+w, o-x__ ===> OJO !!!!


-----

-----

┌─[root@parrot]─[/home/user]
└──╼ #mkdir pepe
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
drwxr-xr-x 1 root root  0 Jul 17 01:39 pepe
┌─[root@parrot]─[/home/user]
└──╼ #useradd pepe -s /bin/bash -d /home/pepe => __se crea un usuario con un shell en especifico y donde se aloja.__

┌─[root@parrot]─[/home/user]
└──╼ #cat /etc/passwd | grep pepe
pepe:x:1001:1001::/home/pepe:/bin/bash

-----
-----

┌─[root@parrot]─[/home/user]
└──╼ #__chgrp__ pepe pepe
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
drwxr-xr-x 1 root __pepe__  0 Jul 17 01:39 pepe
┌─[root@parrot]─[/home/user]
└──╼ #__chown__ pepe pepe
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
drwxr-xr-x 1 __pepe__ __pepe__  0 Jul 17 01:39 pepe
