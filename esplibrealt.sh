#!/usr/bin/env bash

localspace=$( df -kh --output=avail /home ) #on attribut l'output de la commande df à notre variable

if [ ! -e "/home" ] #check si le volume de stockage est présent
	then
		echo "Erreur, volume de sauvegarde absent"
		exit

fi

if [[ $localspace -lt 10 ]] # si espace libre < 10GB
	then
		echo "Espace libre insuffisant"
	else
		echo "Espace suffisant..."

fi
