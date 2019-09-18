#!/bin/bash

function gen() {
  bash $SVV_SCRIPTS/gen.sh $@
}

function del() { 
  bash $SVV_SCRIPTS/del.sh $@
}

if (( $# < 1 )); then
    echo "Illegal number of parameters"
    exit
fi

if [ "$1" == "gen" ]; then
    gen ${@:2}
elif [ "$1" == "del" ]; then
    del ${@:2}
else
    echo "No module $1 registred"
fi


# echo "args 0: ${@:0}"
# echo "args 1: ${@:1}"
# echo "args 2: ${@:2}"
# echo "args 3: ${@:3}"

# args 0: /home/mab/Documents/svv/scripts/mab.sh chum doch du
# args 1: chum doch du
# args 2: doch du
#args 3: du
