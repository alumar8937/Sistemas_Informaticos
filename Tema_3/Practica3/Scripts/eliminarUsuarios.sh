#!/bin/bash

IFS=","

while read nombre
do

    userdel $nombre

    if [ $? -eq 0 ] # $? muestra el código de salida del último comando ejecutado. En este caso el valor 0 indica que se ha añadido el usuario correctamente.
    then
        echo "Se ha eliminado al usuario: $nombre"
    fi

done < usuarios_a_eliminar.csv
