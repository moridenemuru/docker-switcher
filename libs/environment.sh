#!/bin/bash
#
# environment
# constant variable settings

### path
readonly DOCKER_SWITCHER_ROOT=$(cd $(dirname ${BASH_SOURCE:-$0}); cd ../; pwd)
readonly PATH_INFO="$DOCKER_SWITCHER_ROOT/libs/path_info.txt"
readonly FUNCTIONS="$DOCKER_SWITCHER_ROOT/libs/functions.sh"
readonly DISPLAY_LIST="$DOCKER_SWITCHER_ROOT/libs/display_list.sh"
readonly REGISTER="$DOCKER_SWITCHER_ROOT/libs/register.sh"
readonly UNREGISTER="$DOCKER_SWITCHER_ROOT/libs/unregister.sh"
readonly DELETE_CONTAINER="$DOCKER_SWITCHER_ROOT/libs/delete_container.sh"
readonly START_CONTAINER="$DOCKER_SWITCHER_ROOT/libs/start_container.sh"

### error messages
readonly ERR_BAD_ARG="Bad arguments or options."
readonly ERR_NO_REGISTER="It's not registered"
readonly ERR_NO_CONTAINER="There is no container that is already started."
readonly ERR_ALREADY_REGISTERED="This name is already registered."
readonly ERR_NO_YAML="docker-compose.yml is not found in this directory"
readonly ERR_NO_DIR="This directory is not found."
readonly ERR_BAD_NAME="you can not use this name."
readonly ERR_DEFAULT="ERROR"
