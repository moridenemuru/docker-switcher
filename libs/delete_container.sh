#!/bin/bash
#
# delete_container
# Stop and delete containers of Development Environment that is already started

# source docekr-switcher/lib/environment.sh
env_path="$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/environment.sh"
source $env_path

echo -n -e "\n"
if [ -n "$(docker ps -aq)" ]; then
    echo "Stop and delete containers that is already."
    docker stop $(docker ps -q)
    docker rm $(docker ps -aq)
    exit 0
else
    echo $ERR_NO_CONTAINER
    exit 1
fi