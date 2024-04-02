#!/bin/bash
source sshtoserver_config.sh
if [ "${servermap[$1]}" == "" ]; then
    echo "$1 not in server list"
    echo "Available servers:"
    for server in "${!servermap[@]}"; do
        echo $server
    done
    echo "New servers can be added in sshtoserver_config.sh"
    exit 1
fi
ssh ${servermap[$1]}

