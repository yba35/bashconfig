#! /bin/sh
BACKUP_DIR=/volume1/documents_backup/RSYNC_BACKUP_DELETED_FILES
RSYNC_CMD="echo rsync -az --recursive --delete --progress --stats --backup --backup-dir=$BACKUP_DIR --exclude=Thumbs.db --exclude=.git --times --modify-window=1 -e ssh"
SOURCE_PREFIX=/cygdrive/d
TARGET_PREFIX=root@ryba35.no-ip.biz:/volume1/documents_backup
 
case "$1" in
    dryrun)
        echo "rsync dry-run..."
        $RSYNC_CMD --dry-run $SOURCE_PREFIX/MesDocuments  $TARGET_PREFIX/MesDocuments/
        $RSYNC_CMD --dry-run $SOURCE_PREFIX/MesImages     $TARGET_PREFIX/MesImages/
        $RSYNC_CMD --dry-run $SOURCE_PREFIX/MesVideos     $TARGET_PREFIX/MesVideos/
        $RSYNC_CMD --dry-run $SOURCE_PREFIX/Musique       $TARGET_PREFIX/Musique/
        $RSYNC_CMD --dry-run /cygdrive/c/Users/Titouan/Pictures $TARGET_PREFIX/Photos_Titouan/
     ;;

    rsync)
        echo "rsync sending..."
        $RSYNC_CMD $SOURCE_PREFIX/MesDocuments  $TARGET_PREFIX/MesDocuments/
        $RSYNC_CMD $SOURCE_PREFIX/MesImages     $TARGET_PREFIX/MesImages/
        $RSYNC_CMD $SOURCE_PREFIX/MesVideos     $TARGET_PREFIX/MesVideos/
        $RSYNC_CMD $SOURCE_PREFIX/Musique       $TARGET_PREFIX/Musique/
        $RSYNC_CMD /cygdrive/c/Users/Titouan/Pictures $TARGET_PREFIX/Photos_Titouan/
     ;;
    gitstatus)
        echo "git status on NAS..."
        git status $TARGET_PREFIX
    ;;
    gitcommit)
        echo "git commit on NAS..."
        git commit -m "$2" $TARGET_PREFIX
    ;;
    *)
        echo "Usage: $0 {dryrun|rsync|gitstatus|gitcommit}"
        exit 1
esac

exit 0

