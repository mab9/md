#!/bin/bash

VERSION=2.0.1

# Define the colors
## https://misc.flogisoft.com/bash/tip_colors_and_formatting

TITLE="\e[1m"
TITLE_CLEAN="\e[0m"
SUBTITLE="\e[34m"
#SUBTITLE="\e[1m"
COMMAND="\e[94m"
#COMMAND="\e[32m"
CLEAN="\e[0m"

function helpme () {
    echo -e ""
    echo -e "${SUBTITLE}md framework help ${CLEAN}"
    echo -e ""
    echo -e "${SUBTITLE}General commands${CLEAN}"
    echo -e ""
    echo -e "        ${COMMAND}version${CLEAN}       Show the version"
    echo -e "        ${COMMAND}help${CLEAN}          Show the help"
    echo -e ""
    echo -e "${SUBTITLE}Core functions${CLEAN}"
    echo -e ""

    ### CORE FUNCTIONS
    for core in "${core[@]}"; do
    echo -e "        ${COMMAND}$core${CLEAN}"
    done
    echo -e ""
    echo -e "${SUBTITLE}Available plugins${CLEAN}"
    echo -e ""

    ### PLUGINS
    for plugin in "${plugins[@]}"; do
    echo -e "        ${COMMAND}$(basename $plugin)${CLEAN}"
    done
    echo -e ""
}

function version() {
  printf "md version ${VERSION}\n"
  printf "maintainer: marcantoine.bruelhart@gmail.com\n"
  printf "\n"
}

###
# Check if one of the core script has to be executed and execute it.

function executeCorePlugin() {
  ## gather installed core scripts
  core=($(ls ${MD_INSTALLATION_FOLDER}/core/))

  # todo remove framework item

  for elem in "${core[@]}"; do
    if [ "$elem" = "$1" ]; then
      bash "${MD_INSTALLATION_FOLDER}/core/${elem}/${elem}.sh" "$@"
      exit
    fi
  done
}


###
# Check if one of the installed plugin has to be executed and execute it.

function executePlugin() {
  ## gather installed plugins
  pluginFolder=${MD_INSTALLATION_FOLDER}/plugins/*-plugins/*
  plugins=($(ls -d ${pluginFolder} | egrep -iv "license|readme"))

  for elem in "${plugins[@]}"; do
    if [ "$(basename $elem)" = "$1" ]; then
      bash $elem/$(basename $elem).sh "$@"
      #bash "${MD_INSTALLATION_FOLDER}/plugins/${elem}/${elem}.sh" "$@"
      exit
    fi
  done
}

function executeDefaults() {
  command="$1" # first layer

  case $command in
      --version|-v|version)
          version
          ;;
      --help)
          helpme
          ;;
      *)
          helpme
          ;;
  esac
}

executeCorePlugin "$@"
executePlugin "$@"
executeDefaults "$@"

