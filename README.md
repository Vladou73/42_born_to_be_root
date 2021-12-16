# BORN TO BE ROOT

## TUTO FOLLOWED
- https://github.com/GuillaumeOz/Born2beroot
- https://github.com/HEADLIGHTER/Born2BeRoot-42/blob/main/walkthrough37.txt
- https://www.youtube.com/watch?v=2w-2MX5QrQw&ab_channel=hanshazairi

## USEFUL INFORMATION

### Infos about VM
- OS used : Debian 11 (bullseye) — current stable release (12/2021)
- user = 42 login, VM name = login42
- groups : sudo, user42

### What is ...
- lvm : Il s'agit d'un chiffrement au niveau du disque ou de la partition et non au niveau du système de fichiers. Une phrase de passe est nécessaire pour ouvrir un volume chiffré et sera demandé au démarrage avant l'ouverture de session. Comme on ne peut pas partitionner un volume chiffré, si on veut plusieurs volumes (racine, swap, /home...) on a deux possibilités :
	- créer plusieurs volumes chiffrés (avec chacun leur passphrase)
	- utiliser LVM par-dessus le volume chiffré pour créer des volumes logiques

- mountpoint : https://whatis.techtarget.com/definition/mount-point : A mount point is a directory in a file system where additional information is logically connected  from a storage location outside the operating system’s root drive and partition.
To mount, in this context, is to make a group of files in a file system structure accessible to a user or user group. In some usages, it means to make a device physically accessible. For instance, in data storage, to mount is to place a data medium on a drive in a position to operate.

- sudo and tty : https://www.shell-tips.com/linux/sudo-sorry-you-must-have-a-tty-to-run-sudo/#:~:text=The%20error%20message%20sudo%3A%20sorry,default%20to%20require%20a%20tty%20.
	- sudo = _superuser do_ :  run programms with the security privileges of another user or group which default to the superuser (i.e. root)
	- tty =  teletypewriter

## BASH SCRIPT

- how to get cpu infos in linux : https://blog.shevarezo.fr/post/2017/09/01/6-commandes-linux-recuperer-informations-cpu-processeur

- wall displays a message, or the contents of a file, or otherwise its standard input, on the terminals of all currently logged in users. https://linuxize.com/post/wall-command-in-linux/

- #!/bin/bash : https://stackoverflow.com/questions/8967902/why-do-you-need-to-put-bin-bash-at-the-beginning-of-a-script-file
It's a convention so the *nix shell knows what kind of interpreter to run.

- chmod - Modifier les autorisations d'accès à un fichier : need to authorize execution of bash script : http://manpagesfr.free.fr/man/man1/chmod.1.html


### Bash Commands
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
- | : un pipe permet de passer le résultat d'une commande shell à une autre commande shell.

### Cron setup
- what is a cron and crontab : https://www.linuxtricks.fr/wiki/cron-et-crontab-le-planificateur-de-taches
- flag -u : specify user. flag -e : This option is used to edit the current crontab using the editor specified by the VISUAL or EDITOR environment variables.
- on command sudo crontab -u root -e, file created automatically stored in /var/spool/cron
- check cron logs :  grep CRON /var/log/syslog

## USEFUL FILES AND DIRECTORIES
- /var/log/sudo/logfile : log all sudo commands made
- /etc/sudoers.d/sudoconfig : wrote all sudo configuration in there
- Inspect /proc/net/sockstat and /proc/net/sockstat6 to get established ccdonnections (inuse)
- address Media Access Control (mac : https://fr.wikipedia.org/wiki/Contr%C3%B4le_d%27acc%C3%A8s_au_support)
- /boot : static files of the boot loader
- /etc/groups : groups and users
- /etc/login.defs && /etc/pam.d/common-password : password policies were defined at those places. installed libpam-pwquality package to handle password quality


## TIPS
- Conserver la meme signature electronique : utiliser un snapshot pour qu'il n'y ait pas de modif de la signature electronique entre les corrections 
- connexions SSH :
	- connexion : ssh <vmusername>@localhost -p 4242
	-  utiliser l'option -v pour debug
	- logout cmd : exit
- list groups in linux : cat /etc/group : https://devconnected.com/how-to-list-users-and-groups-on-linux/
- check ssh status and firewall ufw statuses : sudo service ssh status // sudo ufw status
- change passwords : passwd (&& sudo passwd)