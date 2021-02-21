#!/bin/bash


function cloneToolkits() {
  echo "Start cloning mab's toolkits from github.com/mab9"
  echo ""

  # check if already cloned.
  #  if existing then do nothing and echo that its already existing
  #  if not existing go to development source folder and clone repo
  #

}

function updateToolkits() {
  echo "Update toolkits from github.com/mab9"
  echo ""

  # check if repo contains changes
  # if no changes then pull master
  # else echo that first has to be stashed -> then probably merge
  #

}

## provide gotos for each repo


function listAvailableToolkits() {
    echo "List of available github.com/mab9 toolkits: "
    echo ""
    echo "js-toolkit            JavaScript"
    echo "camunda-toolkit       Open source process engine"
    echo "pentaho-toolkit       BI tools - ETLs, Reports"
    echo "css-toolkit           CSS3"
}

function instructions() {
  echo "Options:"
  echo "  -c | --clone:           Clone available toolkits from github.com/mab9"
  echo "  -l | --list:            List available toolkits from github.com/mab9"
  echo "  -p | --pull:            Pull available toolkits from github.com/mab9"
  echo ""
  echo "Usage:"
  echo "  md toolkits [Options]"
  echo ""
}

function error() {
  echo "Examples: md toolkits -l"
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
      --list|-l)
          listAvailableToolkits
          ;;
      --pull|-p)
          updateToolkits
          ;;
      --clone|-c)
          cloneToolkits
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
