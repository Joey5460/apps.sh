#!/bin/bash
#sudo systemctl stop v2ray 
#sudo systemctl start v2ray 
if [ $# -eq 0 ];
then
    ~/apps/v2ray/v2ray --config=/home/fossy/.v2ray.config/config.json 
else #tw hk jp
    ~/apps/v2ray/v2ray --config=/home/fossy/.v2ray.config/config.json.$1 
    
fi
