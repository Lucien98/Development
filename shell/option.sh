#!/bin/bash
# https://blog.csdn.net/happyhorizion/article/details/80431468
set -- `getopt a:b:c "$@"`

echo "param = $@"

while [ -n "$1" ]
do
    case "$1" in 
     -a) echo "found option a and param = $2" 
         shift ;;
     -b) echo "found option b and param = $2"
         shift ;;
     -c) echo "found option c, no param." ;;
     --) ;;
     *) echo "what's this?" 
        break ;;
    esac
    shift
done
