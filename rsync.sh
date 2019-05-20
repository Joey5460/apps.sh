#!/usr/bin/env bash
#push
if [[ $# -eq 0 ]] ; then
    exit 0
fi

key="$1"
case $key in
    login)
        #ssh bardia@127.0.0.1 -p2222
        ssh robot@127.0.0.2 -p2222
        ;;
    backup)
            rsync -azvP --delete --exclude={.local,.cache}  ~/  /run/media/fosy/ssd500/fosy-home/
        ;;
    restore)
            rsync -azvP --delete --exclude={.local}  /run/media/fosy/ssd500/fosy-home/  ~/
        ;;
    *)
        ;;
esac
#shift #past argument or value
#done
       
