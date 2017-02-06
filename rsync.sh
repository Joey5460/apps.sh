#!/usr/bin/env bash
#push
if [[ $# -eq 0 ]] ; then
    exit 0
fi

#while [[ $# -gt 0 ]]
#do
key="$1"
case $key in
    pull)
        if [ "$2" == 'remote' ]
        then
            rsync -azvP 'userver@192.157.226.233':~/anywhere  ~/repositories/anywhere/  
        elif [ "$2" == 'local' ]
        then
            rsync -azvP --delete /run/media/xFrog/backup/anywhere/elts/  ~/Documents/elts 
        fi
        ;;
    push)
        if [ "$2" == 'local' ]
        then
            rsync -azvP --delete ~/Downloads/anywhere/elts/ /run/media/zhouyu/backup/anywhere/elts  
        elif [ "$2" == 'remote' ]
        then
            rsync -azvP --delete ~/Downloads/anywhere/elts/ 'userver@192.157.226.233':~/anywhere/elts
        fi
        ;;
    *)
        ;;
esac
#shift #past argument or value
#done
       
