#!/usr/bin/env bash

if [ ! -e "/media/cdrom" ] #check si le volume de stockage est présent
	then
		echo "Erreur, volume de sauvegarde absent"
		exit
	else
		df -hlP /media/cdrom #affichage espace libre
fi

if [[ $FREE -lt 10485760 ]] # si espace libre < 10GB 
	then
		echo "Espace libre insuffisant"

fi
