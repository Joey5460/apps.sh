#!/usr/bin/bash
if [[ $# -eq 0 ]] ; then
	echo zynaton0517 | sudo -S sslocal -c ~/apps.sh/ss.json -d start
    exit 0
fi

while [[ $# -gt 0 ]]
do
key="$1"
case $key in
    stop)
        echo zynaton0517 | sudo -S sslocal -c ~/apps.sh/ss.json -d stop
        ;;
    vps)
        echo zynaton0517 | sudo -S sslocal -c ~/apps.sh/shadowsocks.json -d start
        ;;
    *)
        ;;
esac
shift # past argument or value
done
