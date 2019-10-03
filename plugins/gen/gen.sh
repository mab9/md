#!/bin/bash


#!/bin/bash

currentBranch=`git symbolic-ref HEAD`
mdConfigFile=/home/mab/.md
workingProject=$(cat $mdConfigFile | grep -i working-project | cut -d "=" -f 2)
sourceDir=$(cat $mdConfigFile | grep -i source-dir | cut -d "=" -f 2)

function listWorkingProjectModules() {
  echo "Show all working-project: ${workingProject} modules:"
  echo ""
  ls ${sourceDir}/${workingProject} | grep -v @234## # grep to have a list with new lines instead to print all on one row.
}

function generateAllModules() {
  echo "Generate all modules from your current working-project and git flow branch: ${currentBranch}"
  echo ""
  pushd ${sourceDir}/${workingProject}*$var*
  eval $(minikube docker-env)
  mvn clean install -DskipTests
  popd
}

function generateModules() {
  echo "Generate modules of your current working-project and git flow branch: ${currentBranch}."

  echo $@
  ls ${sourceDir}/${workingProject} | grep -vE "@234##|pom.xml|*.md|target" | while read -r line ; do

      ## iteriere über jedes modul
      for modules in "$@"
      do :

        ## baue das gewünschte Modul
         case $line in
           *"$modules"*)
              echo ""
              echo "Generate module: $line"
              pushd ${sourceDir}/${workingProject}*$var* > /dev/null
              eval $(minikube docker-env)
              mvn clean install -DskipTests
              popd > /dev/null
             ;;
         esac

      done

      # todo add module not found and invoke error function
  done
  echo ""
}

function instructions() {
  echo "Options:"
  echo "  -l | --list-modules:   List all working-projects modules"
  echo "  -a | --all:            Generate all working-projects modules without executing tests (-Dskiptests=true)"
  echo "  -m | --modules         Generate all modules from the working-project, that contains the string that is passed by the argument"
  echo "       --help            Show help"
  echo ""
  echo "Usage:"
  echo "  md gen [Options] [Working-Project Module Name]"
  echo ""
}

function error() {
  echo "Examples: md gen -m core"
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
          generateAllModules
          ;;
      --help)
          help
          ;;
      --modules|-m)
          generateModules ${@:3}
          ;;
      *)
          error
          ;;
  esac
}

executeDefaults $@