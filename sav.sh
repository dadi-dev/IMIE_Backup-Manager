#!/usr/bin/env bash

	read -p " bonjour, souhaitez vous transférer un fichier? répondez oui ou non : " fct1

		if [ $fct1 != oui ]
then
			echo " au revoir "
exit 1
fi
		if [ $fct1 = oui ]
then
		read -p " entrez le nom du fichier : " fichier
		read -p "entrez votre nom d'utilisateur : " nom
		read -p "entrez le nom du serveur : " serveur
		read -p "entrez ip du serveur : " ip

	for variable in $fichier $nom $serveur $ip
do
		echo "$variable"
done
fi

		if [ $ip = 10.5.1.192 ]
then
	scp -r -p /home/$nom/$fichier $serveur@$ip:$fichier
echo " votre fichier est téléchargé  "
exit 1
fi

	scp -r -p /home/$nom/$fichier $serveur@$ip:/home/$serveur
