#!/usr/bin/env bash

# SCRIPT POUR LE CHOIX DU TYPE DE SUPPORT

support=$1

# choix du type de support, si c'est une clé USB, je monte le support, sinon c'est un disque dur, je crée une partition

while read "Votre support de sauvegarde est une clé USB (=U) ou un disque dur (D):" $1
if [$1 -eq U]
  then
    mount -t ext4
    # script pour faciliter l'accès au fichier sans se soucier d'où il provient :
    DIR=$(cd $(dirname $(readlink) -f $(0)) && pwd)
    # mettre ici le lien vers le script de demande de place suffisante : . chemin du script nom_du_script.sh
  elif [$1 -eq D]
    then
    # mettre ici le lien vers script pour créer une partition : . chemin du script nom_du_script.sh
      #sinon la saisi est différente de D et U, affiche
else
  for [$1 -gt [U,D]
  do
    echo " saisi la lettre majuscule U pour une clé USB ou la lettre D pour un disque dur"
  done
fi
