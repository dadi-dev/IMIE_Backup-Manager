# ! usr/bin/env bash
# backup manager : utilisé de sauvegarde automatique
# public concerné : admin r&s

# active le mode debug, commenter pour desactiver !
#set -x

# Déclaration des variables.

# chemin relatif du script de sauvegarde. Pour le relancer si nécéssaire !
DIR=$(dirname $(readlink -f $0))

# date et temps
DATE=$(date +%y-%m-%d-%H-%M-%S)

# chemin du repertoire de stockage local.
REPBACKUP=$"/Sauvegardes/Backup"

# ici le repertoire $home pour tester la validité du script simplement.
CIBLE="$HOME/* "

LOCALSPACE=$(df -kh --output=avail $HOME)

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

    sudo -S --login bash $DIR/$0

  fi

else

  # choix sauvegarde  et ou restauration .

    echo "l'espace disque local disponible est de $LOCALSPACE"

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



SAV=$1

while [ -z "$SAV" ]

do
	read -p " Faire une sauvegarde ou un backup [sauvegarde/restoration] ? " SAV
	if [[ "$SAV" == "sauvegarde" ]]

	then
FREE=$2

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

	elif [[ "$SAV" == "restoration" ]]; then
	#statements

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

	else
		echo "Vous devez saisir sauvegarde pour enregistret vos fichies et saisir réstauration pour retrouver vos anciens fichiers "
	fi
done
