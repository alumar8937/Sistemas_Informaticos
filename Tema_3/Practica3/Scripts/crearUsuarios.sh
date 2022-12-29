#!/bin/bash

IFS=","

while read nombre contrasenya nombre_completo grupo descripcion
do

    useradd -c "$nombre_completo,$descripcion" -p $contrasenya -G $grupo $nombre

    if [ $? -eq 0 ] # $? muestra el código de salida del último comando ejecutado. En este caso el valor 0 indica que se ha añadido el usuario correctamente.
    then
        echo "Se ha añadido al usuario: $nombre"
    fi

    chage -d0 $nombre

done < usuarios.csv
