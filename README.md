BORN TO BE ROOT



OS used : Debian 11 (bullseye) — current stable release (12/2021) // optical drive


user vnafissi
name = vnafissi42
manual installation
partition lvm chiffree

lvm : Il s'agit d'un chiffrement au niveau du disque ou de la partition et non au niveau du système de fichiers. Une phrase de passe est nécessaire pour ouvrir un volume chiffré et sera demandé au démarrage avant l'ouverture de session. Elle n'a rien à voir avec un mot de passe d'utilisateur. Comme on ne peut pas partitionner un volume chiffré, si on veut plusieurs volumes (racine, swap, /home...) on a deux possibilités :
- créer plusieurs volumes chiffrés (avec chacun leur passphrase)
- utiliser LVM par-dessus le volume chiffré pour créer des volumes logiques

L'installation avec boot chiffré diffère d'une installation standard par trois points :

le partitionnement : http://papy-tux.legtux.org/doc1174/index.html l'installation avec boot chiffré décrite ici fait appel à

une partition chiffrée occupant tout le disque

contenant les 4 volumes logiques : boot, root, swap et home. boot et root doivent nécessairement être des volumes séparés, le swap est optionnel, root et home pourraient être regroupés.

l'activation du chiffrement au niveau de grub, effectuée, en console, au cours de l'installation de grub

le déverrouillage automatique de la partition chiffrée par le noyau, effectué, après l'installation du système de base

what is mountpoint https://whatis.techtarget.com/definition/mount-point : A mount point is a directory in a file system where additional information is logically connected  from a storage location outside the operating system’s root drive and partition.
To mount, in this context, is to make a group of files in a file system structure accessible to a user or user group. In some usages, it means to make a device physically accessible. For instance, in data storage, to mount is to place a data medium on a drive in a position to operate.

2 partitions
1) primary 500 MB
2)logical max / 8.1 GB

- /boot : static files of the boot loader


### PROBLEMS
- how to know which debian version I have for the VM? https://linuxize.com/post/how-to-check-your-debian-version/


TUTO FOLLOWED : https://github.com/GuillaumeOz/Born2beroot



### Conserver la bonne signature electronique
- utiliser snapshot pour qu'il n'y ait pas de modif de la signature electronique entre les corrections 


 condition enforcing = 1 dans /etc/pam.d/common-password


SSH
- utiliser l'option -v pour debug



what means sudo and tty : https://www.shell-tips.com/linux/sudo-sorry-you-must-have-a-tty-to-run-sudo/#:~:text=The%20error%20message%20sudo%3A%20sorry,default%20to%20require%20a%20tty%20.


## script bash

- how to get cpu infos in linux : https://blog.shevarezo.fr/post/2017/09/01/6-commandes-linux-recuperer-informations-cpu-processeur

- https://linuxize.com/post/wall-command-in-linux/

#!/bin/bash : https://stackoverflow.com/questions/8967902/why-do-you-need-to-put-bin-bash-at-the-beginning-of-a-script-file
It's a convention so the *nix shell knows what kind of interpreter to run.



### list of commands used
- uname - Afficher des informations sur le système.  --all : afficher toutes les informations
- grep : search input file and select lines that match one or more patterns. flag -c Suppress normal output; instead print a count of matching lines for each input file
- echo
	- n : suppress automatic newline appended at the end
	- e : enable interpretation of backslash escapes
- free : Display amount of free and used memory in the system. flag -m : display in megabytes
- awk : appliquer plusieurs actions a un fichier de la forme : motif {action}. syntaxe inspiree du C. on manipule des enregistrements (chaine de caractères séparée par un retour chariot, generalement une ligne) et des champs (chaine de caractères separée par un espace)
	- Sur l'enregistrement courant, chaque champ = $1, $2 ... $NF
	- NR==2 : 2eme enregistrement (on cherche l'enregistrement ou la ligne = 2)
	- NF=="/" : on cherche le dernier champ (derniere colonne) qui est egale a "/"
- printf : comme en C, specification formatage puis variables : precisions string, nombre de decimales (.2), %% pour afficher un '%', floating number (f)
- df : display free disk space. -h flag : to use unit suffixes and more readable output
- top : display and update sorted information about processes
	-  flags : -n : Non-event mode, calculates CPU usage since the previous sample.
- who : display who is logged in. -b flag : Time of last system boot.
- if ... then... else ... fi (=final)
- wc -- word, line, character, and byte count. -l : count number of lines, written in standard output
- tr - Convertir ou éliminer des caractères (conversion d'un caractere en un autre)
- w -- display who is logged in and what they are doing
- hostname : show system's host name. flag -I : shows all ip addresses
- ip link show : https://linuxize.com/post/linux-ip-command/

### list of files called
- /var/log/sudo/logfile : log all sudo commands made
- Inspect /proc/net/sockstat and /proc/net/sockstat6 to get established connections (inuse)
- address Media Access Control (mac : https://fr.wikipedia.org/wiki/Contr%C3%B4le_d%27acc%C3%A8s_au_support)
