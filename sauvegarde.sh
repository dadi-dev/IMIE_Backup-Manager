#!/usr/bin/env bash

# active le mode debug, commenter pour desactiver !
set -x

# Déclaration des variables.

# chemin relatif du script de sauvegarde. Pour le relancer si nécéssaire !
DIR=$(dirname $(readlink -f $0))

# date et temps
DATE=$(date +%y-%m-%d-%H-%M-%S)

# chemin du repertoire de stockage local.
REPBACKUP=$"/Sauvegardes/Backup"

# ici le repertoire $home pour tester la validité du script simplement.
CIBLE="$HOME/* "

# test uid utilisateur.
if [ $(id -u) -ne 0 ]

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

      # crée l'archive tar au format zip !
      # modifier l'argument correspondant à la compression désiré.
      tar -cvzpf $REPBACKUP/backup-$DATE.tar.gz $CIBLE

    else

      # Restaure l'archive !
      tar -xzf $REPBACKUP/backup.tar.gz -C $HOME


    fi

fi

  echo "- Terminée !"
