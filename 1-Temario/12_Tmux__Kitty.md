# Se gana el agilidad !!!
# esta Oh My Tmux !!!

┌─[root@parrot]─[/home/user/Desktop]
└──╼ # tmux *Asi se inicia*

┌─[root@parrot]─[/home/user/Desktop]
└──╼ #tmux new -s Testing *Abrirlo con un nombre => es lo MEJOR!!!*

----
VENTANAS:
# CTL + B , luego "," => se puede cambiar el nombre de la ventana actual
# CTL + B , luego "C" => crea otra ventana nueva

[Testing] 0:pruebas* 1:prueba2-                  __Esto aparece abajo__
Para cambiar entre ventanas es:
# CTL + B , luego "0" o numero de la ventana (en este caso es 0 o 1)

----
PANELES HORIZONTAL Y VERTICAL:
# CTL + B , luego "shift + "" " => Nueva PANEL en forma __Horizontal__
Para ir alternando
# CTL + B , luego "Flecha Arriba o Abajo"

Para cerrar el panel
# CTL + B , luego "X"

# CTL + B , luego "shift + 5" " => Nueva PANEL en forma __Ventical__
Para ir alternando
# CTL + B , luego "Flecha Derecha o Izquierda"

Para ir moviendo el espacio (SIZE):
# CTL + B , luego "Flecha Derecha o Izquierda"

----

Para tachear:
# CTL + B , luego "D" => datached !!! se puede volver a la sesión
┌─[root@parrot]─[/home/user/Desktop]
└──╼ # tmux list-sessions

┌─[root@parrot]─[/home/user/Desktop]
└──╼ # tmux attach -t {Nombre de la Sesión creada}

Para ver todas las sesiones datached dentor de una sesión:
# CTL + B , luego "W" => se ven las sesiones y que contienen !!!


----------------------------------------------------------------------
# KITTY - configuraciones !!!!

## Renombrar ENTORNOS de trabajo
- Ctl+Shift+Alt+T
## Crear nuevos Paneles p Vetanas
- Ctl+Shift+Enter
## Reordenar Paneles (diferentes manera de reordenar)
- Ctl+Shift+L
## Cerrar paneles
- Ctl+Shift+W
## Seleccionar Paneles
- Ctl+Arriba o Abajo
- o tan solo con el MOUSE
## Subir paneles o Bajarlos
- Ctl+Shift+F
- Ctl+Shift+B

## CREAR NUEVO ENTORNO
- Ctl+Shift+T
# MOVER ENTORNOS DE TRABAJO
- Ctl+Shift+ .
- Ctl+Shift+ ,

## Cambiar ENTORNOS con MOUSE

## Resize de Ventanas o Paneles
- Ctl+Shift+R ::

  Wider = agranda vertical
  Narrower = achica vertical
  Taller = agranda horizontal
  Shorter = achica horizontal
  Reset => RESETEA LA CONFIG

- ESC para salir