#!/bin/bash
#
# switch_docker
# switching Development Environment using with docker-compose

# source docekr-switcher/lib/environment.sh
env_path="$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/libs/environment.sh"
source $env_path

##
# usage
# usage setting
##
function usage()
{
    echo -n -e "\n"
    echo "Usage: switch_docker.sh [-l] [-r] [-u] [-d] [-s name] [-h]"
    echo -n -e "\n"
    echo "[-l] : Display a list of Development Environment that is already registered."
    echo "[-r] : Register Development Environment."
    echo "[-u] : Unregister Development Environment."
    echo "[-d] : Stop and delete containers of Development Environment that is already started."
    echo "[-s name] : Starting Development Environment. please input with Development Environment name you registered."
    echo "[-h] : Display help"
    echo -n -e "\n"
    echo "Also you can use some of these options at the same time."
    echo "ex:) [-ds name] [-ls name] [-lr] [-lu] etc..."
    echo -n -e "\n"
    return 0
}

# make docekr-switcher/libs/path_info.txt if not existing
if [ ! -e $PATH_INFO ]; then
    touch $PATH_INFO
fi

# check existance of args
if [ $# -le 0 ]; then
    echo $ERR_BAD_ARG
    usage
    exit 1
else
    # check first arg
    if [ ${1:0:1} = "-" ]; then
        while getopts lruds:h OPT
        do
            case $OPT in
                l)  bash $DISPLAY_LIST
                    ;;
                r)  bash $REGISTER
                    ;;
                u)  bash $UNREGISTER
                    ;;
                d)  bash $DELETE_CONTAINER
                    ;;
                s)  bash $START_CONTAINER $OPTARG
                    ;;
                h)  usage
                    ;;
                \?) usage
                    ;;
            esac
            echo -n -e "\n"
        done
        shift $((OPTIND - 1))
        exit 0
    else
        echo $ERR_BAD_ARG
        usage
        exit 1
    fi
fi
