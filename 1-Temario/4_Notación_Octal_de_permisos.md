
__drwxr-xr-x__ 1 root root  0 Jul 18 19:27 testing
----
rwx r-x r-x
111 101 101 => 7 5 5 => 755
----
┌─[✗]─[root@parrot]─[/home/user]
└──╼ #chmod 755 testing
# FUNCIONA CORRECTAMENTE !!!
xx
----
Tambien se pueden ir cambiando octalmente:

┌─[root@parrot]─[/home/user]
└──╼ #chmod 542 testing

__dr-xr---w-__ 1 root root  0 Jul 18 19:27 testing
r-x r-- -w-
101 100 010 => 5 4 2 => ESTA CORRECTO !!!!