┌─[✗]─[root@parrot]─[/home/user/Desktop]
└──╼ #find / -group user -type d 2>/dev/null | xargs ls -l

┌─[✗]─[root@parrot]─[/home/user/Desktop]
└──╼ #find / -group user -type d 2>/dev/null

┌─[✗]─[root@parrot]─[/home/user/Desktop]
└──╼ #find / -group user -type f 2>/dev/null

┌─[✗]─[root@parrot]─[/home/user/Desktop]
└──╼ #find / -user root -writable 2>/dev/null

┌─[✗]─[root@parrot]─[/home/user/Desktop]
└──╼ #find / -user root -executable 2>/dev/null
┌─[✗]─[root@parrot]─[/home/user/Desktop]
└──╼ #find / -user root -executable -type f 2>/dev/null

__Cuando se te olvida el nombre__
┌─[root@parrot]─[/home/user/Desktop]
└──╼ #find / -name dex\* 2>/dev/null 
└──╼ #find / -name \*exdum\* 2>/dev/null 
└──╼ #find / -name dex\*.sh 2>/dev/null 

# BUSQUEDA A NIVEL DE SISTEMA !!!!

┌─[root@parrot]─[/home/user/Desktop]
└──╼ # __find --help__
Usage: find [-H] [-L] [-P] [-Olevel] [-D debugopts] [path...] [expression]

Default path is the current directory; default expression is -print.
Expression may consist of: operators, options, tests, and actions.

Operators (decreasing precedence; -and is implicit where no others are given):
      ( EXPR )   ! EXPR   -not EXPR   EXPR1 -a EXPR2   EXPR1 -and EXPR2
      EXPR1 -o EXPR2   EXPR1 -or EXPR2   EXPR1 , EXPR2

Positional options (always true):
      -daystart -follow -nowarn -regextype -warn

Normal options (always true, specified before other expressions):
      -depth -files0-from FILE -maxdepth LEVELS -mindepth LEVELS
       -mount -noleaf -xdev -ignore_readdir_race -noignore_readdir_race

Tests (N can be +N or -N or N):
      -amin N -anewer FILE -atime N -cmin N -cnewer FILE -context CONTEXT
      -ctime N -empty -false -fstype TYPE -gid N -group NAME -ilname PATTERN
      -iname PATTERN -inum N -iwholename PATTERN -iregex PATTERN
      -links N -lname PATTERN -mmin N -mtime N -name PATTERN -newer FILE
      -nouser -nogroup -path PATTERN -perm [-/]MODE -regex PATTERN
      -readable -writable -executable
      -wholename PATTERN -size N[bcwkMG] -true -type [bcdpflsD] -uid N
      -used N -user NAME -xtype [bcdpfls]
