┌─[user@parrot]─[~/Desktop/tiago]
└──╼ $chmod +x script.sh
┌─[user@parrot]─[~/Desktop/tiago]
└──╼ $ls -l
total 0
-rwxr-xr-x 1 user user 0 Jul 20 23:23 script.sh

--- 

┌─[user@parrot]─[~/Desktop/tiago]
└──╼ $ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host noprefixroute 
       valid_lft forever preferred_lft forever
2: ens160: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 00:0c:29:b9:78:d7 brd ff:ff:ff:ff:ff:ff
    altname enp2s0
    inet 172.16.222.130/24 brd 172.16.222.255 scope global dynamic noprefixroute ens160
       valid_lft 1540sec preferred_lft 1540sec
    inet6 fe80::ff29:5440:9f19:9070/64 scope link noprefixroute 
       valid_lft forever preferred_lft forever

# Forma de editar la consulta para solo obtener la IP de ENS160
┌─[✗]─[user@parrot]─[~/Desktop/tiago]
└──╼ $ip a | grep ens160 | tail -n 1 | awk '{print $2}' | awk '{print $1}' FS="/"
172.16.222.130

# Ahora editar un bash con nvim a script.sh
- -e : para caracteres especiales como \n. Tambien
'''bash
!/bin/bash

echo -e "\n[+] Esta es tu dirección IP privada -> $(ip a | grep ens160 | tail -n 1 | awk '{print $2}' | awk '{print $1}' FS="/")\n"
'''
┌─[user@parrot]─[~/Desktop/tiago]
└──╼ $./script.sh

[+] Esta es tu direccion IP privada -> 172.16.222.130
