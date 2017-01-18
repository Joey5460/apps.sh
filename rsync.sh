#!/usr/bin/env bash
#push
if [[ $# -eq 0 ]] ; then
    rsync -azvP --delete ~/Downloads/anywhere/review/ 'userver@192.157.226.233':~/anywhere
    exit 0
fi

while [[ $# -gt 0 ]]
do
case $key in
    pull)
        rsync -azvP 'userver@192.157.226.233':~/anywhere  ~/rsync_repo/anywhere/  
        ;;
    *)
        ;;
esac
shift #past argument or value
done
       
