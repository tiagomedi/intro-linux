# LSATTR
┌─[root@parrot]─[/home/user]
└──╼ #ls prueba
prueba
┌─[root@parrot]─[/home/user]
└──╼ #lsattr
----------------C----- ./prueba

# CHATTR
+i = inmutable.
-V = liste en mmodo verbose (al ejecutar comando, ver en forma descriptiva que esta pasando por detras !!!)
┌─[root@parrot]─[/home/user]
└──╼ #chattr +i -V prueba
chattr 1.47.2 (1-Jan-2025)
Flags of prueba set as ----i------------C----
----

┌─[root@parrot]─[/home/user]
└──╼ #ls -l
total 4
drwx------ 1 user user  52 Jul 17 01:02 Desktop
drwxr-xr-x 1 user user   0 Jul 16 22:44 Documents
drwxr-xr-x 1 user user   0 Jul 16 22:44 Downloads
drwxr-xr-x 1 user user   0 Jul 16 22:44 Music
drwxr-xr-x 1 user user   0 Jul 16 22:44 Pictures
drwxr-xr-x 1 user user   0 Jul 16 22:44 Public
drwx------ 1 user user  22 Jul  7 12:20 Templates
drwxr-xr-x 1 user user   0 Jul 16 22:44 Videos
-rw-r--r-- 1 root root 163 Jul 19 04:55 prueba
┌─[root@parrot]─[/home/user]
└──╼ #lsattr prueba
----i----------------- prueba
# ROOT NO PUEDE ELIMINAR "PRUEBA" !!!!
AL SER INMUTABLE NO SE PUEDEN BORRAR !!!
## pero con -i se puede eliminar !!!
┌─[root@parrot]─[/home/user]
└──╼ #chattr __-i__ -V prueba
chattr 1.47.2 (1-Jan-2025)
Flags of prueba set as ----------------------
┌─[root@parrot]─[/home/user]
└──╼ #lsattr prueba
---------------------- prueba

