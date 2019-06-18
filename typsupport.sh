#!/usr/bin/env bash

support=$1
# choix du type de support, si c''est une clé USB, je monte le support, si c''est un disque dur, je crée une partition
read "Votre support de sauvegarde est une clé USB (=U) ou un disque dur (D)" $1
if [$1= U]
then

