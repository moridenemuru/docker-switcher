#!/bin/bash
#
# unregister.sh
# Unregister Development Environment

# source docekr-switcher/lib/environment.sh
env_path="$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/environment.sh"
source $env_path

# source docekr-switcher/lib/functions.sh
source $FUNCTIONS


# input name of Development Environment
while [ -z $name ]
do
    echo "Please input a name of Development Environment you want unregister."
    read name
done
echo -n -e "\n"

# check if a name that user input is registered
line_num=0
while read line
do
line_num=$(($line_num + 1))
if [ ! -z $line ]; then
    line_head=$(echo $line | get_name)
    if [ $line_head = $name ]; then
        unregister_line=$line_num
    fi
fi
done < $PATH_INFO

# comfirm
if [ ! -z $unregister_line ]; then
    while [ -z $confirm ]
    do
        echo "confirm"
        read -p "Is it sure to unregister this Development Environment? (yes/no): " yn;
        case "$yn" in
        y) confirm=1;;
        yes) confirm=1;;
        n) confirm=0;;
        no) confirm=0;;
        *) ;;
        esac
    done

    echo -n -e "\n"
    if [ $confirm = 1 ]; then
        sed -i -e "${unregister_line}d" $PATH_INFO
        echo "unregistration is done."
    else
        echo "unregistration is quitted."
    fi

else
    bash $ERR_NO_REGISTER
    exit 1
fi

exit 0