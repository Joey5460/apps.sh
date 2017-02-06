#!/usr/bin/env bash
#push
if [[ $# -eq 0 ]] ; then
    exit 0
fi

while [[ $# -gt 0 ]]
do
key="$1"
case $key in
    pull)
        rsync -azvP 'userver@192.157.226.233':~/anywhere  ~/repositories/anywhere/  
        ;;
    usb)
        rsync -azvP --delete ~/Downloads/anywhere/elts/ /run/media/zhouyu/backup  
        ;;
    s)
        rsync -azvP --delete ~/Downloads/anywhere/elts/ 'userver@192.157.226.233':~/anywhere/elts
        ;;
    *)
        ;;
esac
shift #past argument or value
done
       
