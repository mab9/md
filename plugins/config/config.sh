#!/bin/bash


echo config plugin

echo $@


function workingProject() {
  echo "describe working-project"
}

function help() {
  echo "describe help"
}

function executeDefaults() {
  command="$1"

  case $command in
      --working-project|-w)
          workingProject
          ;;
      --help)
          help
          ;;
      *)
          help
          ;;
  esac
}

executeDefaults