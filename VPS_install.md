# Installation OpenVPN

# Installation Owncloud

# Sauvegarde Owncloud
- Se logger sur le NAS 
Lancer le script de sauvegarde qui contient le code suivant:

    ssh root@149.202.57.63 ./backup_owncloud.sh
    scp root@149.202.57.63:owncloud-dirbkp.tgz Sauvegardes_OwnCloud_VPS/backup_owncloud_`date +"%Y%m%d"`.tgz

# Installation Serveur XMPP
