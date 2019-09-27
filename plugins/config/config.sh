#!/bin/bash

#echo config plugin
#echo @

function listProjects() {
  echo "Projects from the folder /home/mab/development/source:"
  echo ""
  ls ~/development/source | grep -v @#@
}

function workingProject() {
  projects=( $(ls ~/development/source | grep -v @#@) ) # Einschränkung -> kein Projekt darf @#@ im Namen beinhalten!
  projects+=(exit)

  select project in "${projects[@]}"; do
      [[ $project == exit ]] && break

      ## break if value is between the size of the array
      if [[ "$project" < "${#projects[@]}" ]] ; then
        echo You have to chose a number between 1 and ${#projects[@]}
      else
        # actualize the working project

        ## todo add config file to save the current working project
        echo "You have chosen and configured the project: $project as working project"
        exit
      fi
    done
}

function instructions() {
  echo "Options:"
  echo "  -l | --list-projects:       Output a list of all projects that are stored in ~/development/source"
  echo "  -w | --working-project:     Set a default working project to use it with other md commands like: 'md del camunda'"
  echo "       --help:                Show help"
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
      --list-projects|-l)
          listProjects
          ;;
      --working-project|-w)
          workingProject
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