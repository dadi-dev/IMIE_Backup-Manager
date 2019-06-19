#!/usr/bin/env bash
# pour le transfert de fichier avec scp nous avons besoin :
# coté client : de l'emplacement des repertoires, du nom du fichier à envoyer, du nom du propriétaire.
# coté serveur : du nom du serveur, de son addresse IP, de l'emplacement de destination
# ici, les les répertoires d'envoie et de reception sont les repertoires des utilisateurs.

# nous posons un read afin de lancer la fonction de sauvegarde
read -p " bonjour, souhaitez vous transférer un fichier? répondez oui ou non : " fct1

							if [ $fct1 != oui ] # si la fonction est non validée par oui
			then
										echo " au revoir "
			exit 1
fi
							if [ $fct1 = oui ] # si la fonction est validée par oui
			then
# on rempli les conditions d'envoie du fichier à savoir le nom du fichier, le propriétaire, et le destinataire
#l'ip fixe du destinataire est déterminée suivant son nom de poste.
				read -p " entrez le nom du fichier : " fichier
				read -p " entrez votre nom d'utilisateur : " nom
				read -p " entrez le nom du service julien ou thierry : " serveur

fi
				for variable in $fichier $nom $serveur $ip
do
										echo "$variable"
done

							if [ $serveur = julien ]
			then
							ip='10.5.1.169' 			#ip du poste distant
							serveur='IMIE-CAEN04' #nom du poste

#transfert du fichier dans le repertoire des utilisateurs avec la commande scp
#sur un poste windows: activer ssh dans les services windows
								scp -r -p /home/$nom/$fichier $serveur@$ip:$fichier

										echo " votre fichier est téléchargé  "
			exit 1
fi
							if [ $serveur = thierry ]
			then
							ip='10.5.1.130' 		#assignation de l'ip du service maintenance
							serveur='khatz' 		#nom du poste

#transfert du fichier dans le repertoire des utilisateurs avec la commande scp
#sur un poste Linux
								scp -r -p /home/$nom/$fichier $serveur@$ip:/home/$serveur

										echo " votre fichier est téléchargé  "
			exit 1
fi
