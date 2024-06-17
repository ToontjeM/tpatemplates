#!/bin/bash
cd $1
for i in 1 
do
    
    sshpass -p vagrant ssh-copy-id -i id_$1 vagrant@192.168.0.21$i
    ssh-keyscan -H 192.168.0.21$i >> tpa_known_hosts
done

echo "Remember to add \`-K\` to the \"tpaexec deploy $1\" command!"
