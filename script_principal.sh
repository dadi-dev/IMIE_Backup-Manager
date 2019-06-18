#!/usr/bin/env bash

# Script principal

Echo "Bonjour, Bienvenue dans le monde de l'automatisation"

 # script pour faciliter l'accès au fichier sans se soucier d'où il provient :
DIR=$(cd $(dirname $(readlink) -f $(0)) && pwd)
# appel du fichier de choix sauvegarde/restauration
. menu-initial.sh

# à complèter avec les autres scripts

exit
