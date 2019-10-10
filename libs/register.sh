#!/bin/bash
#
# register
# registering information of Development Environment

# source docekr-switcher/lib/environment.sh
env_path="$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/environment.sh"
source $env_path

# source docekr-switcher/lib/functions.sh
source $FUNCTIONS


# input name of Development Environment
while [ -z $name ]
do
    echo "Please input a name of Development Environment you want register."
    read name
done
echo -n -e "\n"

# a name started with "-" can not using
if [ ${name:0:1} != "-" ]; then
    # check if this name is already registered
    while read line
    do
        if [ ! -z $line ]; then
            registered_name=$(echo $line | get_name)
            if [ $registered_name = $name ]; then
                echo $ERR_ALREADY_REGISTERED
                exit 1
            fi
        fi
    done < $PATH_INFO
else
    echo $ERR_BAD_NAME
    exit 1
fi


# input path of Development Environment
while [ -z $path ]
do
    echo "Please input a directory path that contains docker-compose.yml of Development Environment."
    read path
done
echo -n -e "\n"

# check if directory that user input is existing
if [ -e $path ]; then
    # check if docker-compose.yml is existing in the directory
    file="$path/docker-compose.yml"
    if [ ! -e "$file" ]; then
        bash $ERR_NO_YAML
        exit 1
    fi
else
    bash $ERR_NO_DIR
    exit 1
fi

# registering Development Environment
echo "$name,$path" >> $PATH_INFO
echo "registration is done."
echo "name：$name"
echo "path：$path"
exit 0