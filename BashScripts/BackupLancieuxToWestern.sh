echo "Starting Backup..."
BACKUP_DIR=""
CMD="rsync -dry-run --recursive --exclude=Thumbs.db --times --modify-window=1 --chmod=ugo=rwX --itemize-changes"

$CMD --exclude=Downloads --exclude=ASUS --exclude=CyberLink /cygdrive/d/MesDocuments /cygdrive/f/MesDocuments_saved/
$CMD /cygdrive/d/Musique /cygdrive/f/MesDocuments_saved/
$CMD /cygdrive/d/MesImages /cygdrive/f/MesDocuments_saved/
$CMD /cygdrive/d/MesVideos /cygdrive/f/MesDocuments_saved/
$CMD /cygdrive/c/Users/Titouan/Pictures /cygdrive/f/Photos_Titouan_saved/

echo End...

