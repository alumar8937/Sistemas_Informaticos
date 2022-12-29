#!/bin/bash

IFS=","

while read nombre descripcion
do

    groupadd -r $nombre
    if [ $(getent group $nombre) ] # Si el comando devuelve algo significa que ha encontrado el grupo.
    then
        echo "Se ha añadido el grupo: $nombre"
    fi

done < grupos.csv
