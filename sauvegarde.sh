#!/usr/bin/env bash

set -x

# tester uid, ouvrir fichier avec sudo si nécéssaire.

DIR=$(dirname $(readlink -f $0))

if [ $(id -u) -ne 0 ] # test uid utilisateur.

then

  echo " "
  echo "- Les droits Admin sont nécéssaires !"
  echo " "
  echo "- Assurez vous que Sudo est installé sur le système,"
  echo " "
  echo "- Si vous n'êtes pas sûr de ce que vous devez faire,"
  echo " "
  echo "- Contactez votre administrateur !"
  echo " "

  # Conditionnel oui / non, donne la valeur à LOGROOT
read -p "- Vous loguez avec sudo, [oui/non] ? : " LOGROOT

# Si la variable contient la valeur 'non', alors !
  if [ $LOGROOT == "non" ]

  then

    echo "- Fermeture du script !"
    exit 1

  # Sinon demande le mot de passe sudo et relance le script.
  else

    sudo -s --login bash $DIR/$o

  fi

else

  # choix sauvegarde  et ou restauration .
  read -p "- voulez vous lancez une Sauvegarde ou un backup, tapez [save/backup] ? : " SAVBAK

  if [ $SAVBAK == "save" ]

    then

      function name(parameter) {
        #statements
      }

    else

      function name(parameter) {
        #statements
      }

    fi
