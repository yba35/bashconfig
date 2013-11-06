#! /bin/sh
BACKUP_DIR=/volume1/documents_backup/RSYNC_BACKUP_DELETED_FILES
RSYNC_CMD="rsync -z --recursive --delete --itemize-changes --backup --backup-dir=$BACKUP_DIR --exclude=Thumbs.db --exclude=.git --times --modify-window=3600 -e ssh"
SOURCE_PREFIX=/cygdrive/d
TARGET_PREFIX=root@DSM_Lancieux:/volume1/documents_backup
 
case "$1" in
    dryrun)
        echo "rsync dry-run..."
        $RSYNC_CMD --dry-run $SOURCE_PREFIX/MesDocuments/  $TARGET_PREFIX/MesDocuments/
        $RSYNC_CMD --dry-run $SOURCE_PREFIX/MesImages/     $TARGET_PREFIX/MesImages/
        $RSYNC_CMD --dry-run $SOURCE_PREFIX/MesVideos/     $TARGET_PREFIX/MesVideos/
        $RSYNC_CMD --dry-run /cygdrive/c/Users/Titouan/Pictures/ $TARGET_PREFIX/Photos_Titouan/
     ;;

    rsync)
        echo "rsync sending..."
        $RSYNC_CMD $SOURCE_PREFIX/MesDocuments/  $TARGET_PREFIX/MesDocuments/
        $RSYNC_CMD $SOURCE_PREFIX/MesImages/     $TARGET_PREFIX/MesImages/
        $RSYNC_CMD $SOURCE_PREFIX/MesVideos/     $TARGET_PREFIX/MesVideos/
        $RSYNC_CMD /cygdrive/c/Users/Titouan/Pictures/ $TARGET_PREFIX/Photos_Titouan/
     ;;
    *)
        echo "Usage: $0 {dryrun|rsync}"
        exit 1
esac

exit 0

