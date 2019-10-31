#!/bin/bash

VERSION=0.0.1

# Define the colors
## https://misc.flogisoft.com/bash/tip_colors_and_formatting

TITLE="\e[1m"
TITLE_CLEAN="\e[0m"
SUBTITLE="\e[34m"
#SUBTITLE="\e[1m"
COMMAND="\e[94m"
#COMMAND="\e[32m"
CLEAN="\e[0m"


MD_SCRIPTS=${MD_INSTALLATION_FOLDER}/scripts

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
    echo -e "        ${COMMAND}$plugin${CLEAN}"
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
  core=($(ls ${MD_SCRIPTS}/core/))

  for elem in "${core[@]}"; do
    if [ "$elem" = "$1" ]; then
      bash "${MD_SCRIPTS}/core/${elem}/${elem}.sh" "$@"
      exit
    fi
  done
}


###
# Check if one of the installed plugin has to be executed and execute it.

function executePlugin() {
  ## gather installed plugins
  plugins=($(ls ${MD_SCRIPTS}/plugins/))

  for elem in "${plugins[@]}"; do
    if [ "$elem" = "$1" ]; then
      bash "${MD_SCRIPTS}/plugins/${elem}/${elem}.sh" "$@"
      exit
    fi
  done
}

###
# Execute one of the default functions

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

