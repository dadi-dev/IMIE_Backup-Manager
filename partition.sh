#!/usr/bin/env bash
#pour partitionner un disque dur sous Linux
#lsblk -o model,name,type,fstype,size,label
#avec cette ligne de commande :
#on obtient le nom, le modèle et la taille du disque
#je dois lancer cette ligne de commande en arrière plan et afficher à l'utilisateur
#sda ou hdd, ainsi il pourra lancer la création adéquate !
set -x
function partition {
  fdisk /dev/{$B}  #on lance le partitionnement, on doit déjà être en root
  #le début du script a commencé par sauvegarde.sh
    mkfs.ext4 -n Marque_Disque /dev/{$B}  #On lance le partitionnement
    mount /dev/{$B} /mnt/sauvegarde  #on monte le disque

}

lsblk -rn -o name,type,fstype,size | grep -v loop

B=$1
while [[ -z "$B" ]]
do
  read -p "Sur quel support voulez-vous faire votre sauvegarde [disk/part] ? " B
done
#Si on a enfiché une clé USB ou un dd externe, avec la commande précedente
#l'utilisateur peut choisir manuellement son périphérique de stockage
if [[ $B == "sdb" ]]
    then
      partition
  echo "Merci de choisir le lecteur pour la sauvegarde"
fi
