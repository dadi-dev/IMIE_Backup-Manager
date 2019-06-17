# ! usr/bin/env bash
# backup manager : utilisé de sauvegarde automatique
# public concerné : admin r&s
SAVBAK=$1

while [ -z "$SAVBAK" ]

do
	read -p " Faire une sauvegarde ou un backup [sauvegarde/restoration] ? " SAVBAK
	if [[ "$SAVBAK" == "sauvegarde" ]]
	then

	

	elif [[ "$SAVBAK" == "restoration" ]]; then
	#statements

		echo "restoration"

	else
		echo "Vous devez saisir sauvegarde pour enregistret vos fichies et saisir réstauration pour retrouver vos anciens fichiers "
	fi
done
