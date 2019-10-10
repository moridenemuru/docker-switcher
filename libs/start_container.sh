#!/bin/bash
#
# start_container

# source docekr-switcher/lib/environment.sh
env_path="$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/environment.sh"
source $env_path

# source docekr-switcher/lib/functions.sh
source $FUNCTIONS

##
# get_container_path
# Getting the dir path that contains docker-compose.yml
##
function get_container_path()
{
    while read line
    do
    if [ ! -z $line ]; then
        local _name=$(echo $line | get_name)
        if [ $_name = $1 ]; then
            echo $line | get_path
        fi
    fi
    done < $PATH_INFO
    return 0
}

##
# start_containers
# create docker containers
##
function create_container()
{
    echo -n -e "\n"
    cd $1
    echo "creating docekr containers..."
    docker-compose up -d
    docker-compose ps
    return 0
}


path=$(get_container_path $1)

if [ ! -z $path ]; then
    create_container $path
    exit 0
else
    echo $ERR_NO_REGISTER
    exit 1
fi