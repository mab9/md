#!/bin/bash


#!/bin/bash

mdConfigFile=/home/mab/.md
workingProject=$(cat $mdConfigFile | grep -i working-project | cut -d "=" -f 2)
sourceDir=$(cat $mdConfigFile | grep -i source-dir | cut -d "=" -f 2)

function listWorkingProjectModules() {
  echo "Show all working-project: ${workingProject} modules:"
  echo ""
  ls ${sourceDir}/${workingProject} | grep -v @234## # grep to have a list with new lines instead to print all on one row.
}

function generateAll() {
  currentBranch=`git symbolic-ref HEAD`

  echo "Generate modules from the current branch ${currentBranch}"
  echo ""
  echo impl mcis command
}


function deletePod() {
  echo "Delete pods of the current kubernets namespace. "
  echo ""

  cnt=0 ## to check if the scirpt runningPods has to be executed
  i=1 ## to skip the first line

  kubectl get po | cut -d ' ' -f 1 | while read -r line ; do
      test $i -eq 1 && ((i=i+1)) && continue  ## to skip first line

      ## iteriere über jedes Argument
      for pod in "$@"
      do
         :

        ## prüfe ob der Pod vom Argument vorhanden ist und lösche es
         case $line in
           *"$pod"*)
              echo ""
              echo "Generate module: $line"

              pushd ${sourceDir}/${workingProject}*$var*
              eval $(minikube docker-env)
              mvn clean install -DskipTests

              popd
             ;;
         esac
      done

      # todo add module not found and invoke error function
  done
}

function instructions() {
  echo "Options:"
  echo "  -l | --list-modules:   List all working-projects modules"
  echo "  -a | --all:            Generate all working-projects modules without executing tests (-Dskiptests=true)"
  echo "  -p | --pod             Generate all modules from the working-project, that contains the string that is passed by the argument"
  echo "       --help            Show help"
  echo ""
  echo "Usage:"
  echo "  md gen [Options] [Working-Project Module Name]"
  echo ""
}

function error() {
  echo "Examples: md gen -p core"
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
      --list-pods|-l)
          listWorkingProjectModules
          ;;
      --all|-a)
          generateAll
          ;;
      --help)
          help
          ;;
      --pod|-p)
          deletePod $@
          ;;
      *)
          error
          ;;
  esac
}

executeDefaults $@