#!/bin/bash
#
# show_table
# display a list of Development Environment that is already registered

# source docekr-switcher/lib/environment.sh
env_path="$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/environment.sh"
source $env_path

echo -n -e "\n"
echo "This is a list of Development Environment information that is already registered."
echo -n -e "\n"
(echo "NAME,PATH"; echo "---------,----------"; cat $PATH_INFO) |column -t -s,