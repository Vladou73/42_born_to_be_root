BORN TO BE ROOT



OS used : Debian 11 (bullseye) — current stable release (12/2021)

### PROBLEMS
- how to know which debian version I have for the VM? https://linuxize.com/post/how-to-check-your-debian-version/


TUTO FOLLOWED : https://github.com/GuillaumeOz/Born2beroot

HELPERS


### Probleme de place
- utiliser sgoinfre


### Conserver la bonne signature electronique
- utiliser snapshot pour qu'il n'y ait pas de modif de la signature electronique entre les corrections 


### Autres conseils
- ne rien mettre en domain name
- memoire de 8 GB largement suffisant 
- etre sur mac
- on peut laisser les groups/users deja configures

### gestion pwds
- telecharger package libpam-pwquality
ajouter l'option enforce_for_root
- condition enforcing = 1 dans /etc/pam.d/common-password

### partition
- utiliser LVM chiffre puis /home separe


### gestion ports
- redirection de port /portforwarding on virtualbox

SSH
- utiliser l'option -v ==> regarder a quoi cacorrespond