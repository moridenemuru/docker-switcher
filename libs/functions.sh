#!/bin/bash
#
# functions.sh

##
# get_name
# Extract a name of Development Environment from path_info.txt
##
function get_name()
{
    awk '{sub(",.*", "");print $0;}'
}

##
# get_path
# Extract a directory path of Development Environment from path_info.txt
##
function get_path()
{
    awk '{print substr($0, index($0, ","))}' |
    cut -c 2-
}