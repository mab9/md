#!/bin/bash

# the config-gotos.sh file is registered sourced by the register.sh file

MD_SCRIPTS=${MD_INSTALLATION_FOLDER}/scripts

function listGotos() {
  echo "List all goto aliases"
  echo ""
  cat ${MD_SCRIPTS}/config-gotos.sh | grep -i goto

}


function instructions() {
  echo "Options:"
  echo "  -l | --list-gotos:          List all gotos"
  echo "       --help:                Show help"
  echo ""
  echo "Usage:"
  echo "  goto-md-src"
  echo ""
  echo "  Aadd new gotos as alias in config-gotos.sh file"
  echo ""
}

function error() {
  echo "Examples: goto-md-src"
  echo ""
  instructions
}

function help() {
  echo "Help"
  echo ""
  instructions
}

function executeDefaults() {
  command="$2" # second layer

  case $command in
      --list-gotos|-l)
          listGotos
          ;;
      --help)
          help
          ;;
      *)
          error
          ;;
  esac
}

executeDefaults $@
