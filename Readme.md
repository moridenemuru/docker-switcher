# docker-switcher

## Description

This is a tool for switching Development Environment using with docker-compose.

docker-swithcer execute these command instead of you.

    $ docker stop $(docker ps -q)
    $ docker rm $(docker ps -aq)
    
    $ cd /example/directory/path
    $ docker-compose up -d
    $ docker-compose ps

If you start to use this tool, you must register Development Environment information. Please check Usage and Let's try it.

if you set alias like below setting, you can switch Development Environment using with docker-compose form any directory.

    alias docker-switch='bash /Users/example/directory/path/docker-switcher/switch_docker.sh'

have fun!


## Usage

Usage: switch_docker.sh [-l] [-r] [-u] [-d] [-s name] [-h]

[-l] : Display a list of Development Environment that is already registered.

[-r] : Register Development Environment.

[-u] : Unregister Development Environment.

[-d] : Stop and delete containers of Development Environment that is already started.

[-s name] : Starting Development Environment. please input with Development Environment name you registered.

[-h] : Display help

Also you can use some of these options at the same time.

ex:) [-ds name] [-ls name] [-lr] [-lu] etc...

---

## directory structure

    docker-switcher
    ├── Readme.md
    ├── libs
    │   ├── delete_container.sh
    │   ├── display_list.sh
    │   ├── environment.sh
    │   ├── functions.sh
    │   ├── path_info.txt
    │   ├── register.sh
    │   ├── start_container.sh
    │   └── unregister.sh
    └── switch_docker.sh

