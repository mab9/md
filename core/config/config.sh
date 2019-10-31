#!/bin/bash

#echo config plugin
#echo @

mdConfigFile=${HOME}/.md
workingProject=$(cat $mdConfigFile | grep -i working-project | cut -d "=" -f 2)
sourceDir=$(cat $mdConfigFile | grep -i source-dir | cut -d "=" -f 2)

function showCurrentWorkingProject() {
    if [ -z "${workingProject}" ]; then  # n is the default and checks wether a value is here or not. z does the oposit
      printf "You have no working-project configured!\n"
      printf "To configure the working-project use the following command: \nmd config -w\n\n"
    else
      printf "Your current working project is: ${workingProject}.\n\n"
    fi
}

function listProjects() {
  echo "Projects from the folder ${sourceDir}:"
  echo ""
  ls ${sourceDir} | grep -v @#@
}

function changeWorkingProject() {
  projects=( $(ls ${sourceDir} | grep -v @#@) ) # Einschränkung -> kein Projekt darf @#@ im Namen beinhalten!
  projects+=(exit)

  select project in "${projects[@]}"; do
      [[ $project == exit ]] && break

      ## break if value is between the size of the array
      if [[ "$project" < "${#projects[@]}" ]] ; then
        echo You have to chose a number between 1 and ${#projects[@]}
      else
        # actualize the working-project
        wp=$(cat $mdConfigFile | grep -i working-project)
        SEDCMD="s|${wp}|working-project=${project}|g"

        #echo $SEDCMD
        sed -i "${SEDCMD}" ${mdConfigFile}
        printf "Your working-project is now configured as: $project.\n\n"
        exit
      fi
    done
}

function instructions() {
  echo "Options:"
  echo "  -c | --current-working-project:  Show current woring project"
  echo "  -l | --list-projects:            Output a list of all projects that are stored in ~/development/source"
  echo "  -w | --working-project:          Set a default working project to use it with other md commands like: 'md del camunda'"
  echo "       --help:                     Show help"
  echo ""
  echo "Usage:"
  echo "  md config [Options]"
  echo ""
}

function error() {
  echo "Examples: md config -w dab"
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
      --current-working-project|-c)
          showCurrentWorkingProject
          ;;
      --list-projects|-l)
          listProjects
          ;;
      --working-project|-w)
          changeWorkingProject
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