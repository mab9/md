#!/bin/bash


mdConfigFile=${HOME}/.md
workingProject=$(cat $mdConfigFile | grep -i working-project | cut -d "=" -f 2)
sourceDir=$(cat $mdConfigFile | grep -i source-dir | cut -d "=" -f 2)

toolkits=(js-toolkit camunda-toolkit pentaho-toolkit css-toolkit)
#toolkits=(js-toolkit tolly)


function cloneToolkits() {
  echo "Start cloning mab's toolkits from github.com/mab9"
  echo ""

  for item in "${toolkits[@]}"; do
      # todo make directory generic  "${sourceDir}/${elem}" does not work with ~/ syntax
      directory=/home/mab/development/source/${item}
      if [ -d $directory ]; then
          echo "Repository ${item} already exists"
      else
          eval pushd ${sourceDir} > /dev/null
          eval git clone https://github.com/mab9/${item}.git
          popd > /dev/null
          echo ""
      fi
  done
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
