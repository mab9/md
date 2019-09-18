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

function helpme () {
    echo -e ""
    echo -e "---------------------------------------------------------------------"
    echo -e "${TITLE}md framework help ${TITLE_CLEAN}"
    echo -e "---------------------------------------------------------------------"
    echo -e ""
    echo -e "${SUBTITLE}Usage:${CLEAN}  ${COMMAND}md <Command>${CLEAN}"
    echo -e ""
    echo -e "${SUBTITLE}General commands${CLEAN}"
    echo -e ""
    echo -e "        ${COMMAND}about${CLEAN}         Show the general information"
    echo -e "        ${COMMAND}version${CLEAN}       Show the version"
    echo -e "        ${COMMAND}help${CLEAN}          Show the help"
    echo -e ""
    echo -e "${SUBTITLE}Available plugins${CLEAN}"
    echo -e ""
    for plugin in "${plugins[@]}"; do
    echo -e "        ${COMMAND}$plugin${CLEAN}"
    done
}


##
# Ideas

# add plugins, everyone can create theyr own plugin in bash or python or java?
# load plugins that are in a folder and list them

# create scripts for repeated tasks
# easy share of those scripts
# easy installation of plugins in different languages
# description of those plugins and how to install the framework

###############

function version() {
  printf "md version ${VERSION}\n"
  printf "maintainer: marcantoine.bruelhart@gmail.com\n"
  printf "\n"
}

###
# Check if a installed plugin has to be executed and execute it.

function executePlugin() {
  ## gather installed plugins
  plugins=($(ls ./plugins/))

  for elem in "${plugins[@]}"; do
    if [ "$elem" = "$1" ]; then
      bash "./plugins/${elem}/${elem}.sh"
      exit
    fi
  done
}

function executeDefaults() {
  command="$1"

  case $command in
      mvnsetting)
        mvn_settings_change
          ;;
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


executePlugin "$@"
executeDefaults "$@"

# find all plugins
## read all .sh files
## check if they contains the interfac method to call
## check if they have the helper text
## register plugins

# create functions that registrate the md framework in the bashr

## best practices
## https://codeburst.io/13-tips-tricks-for-writing-shell-scripts-with-awesome-ux-19a525ae05ae


# Konvention
# plugins werden in einem Ordner abgelegt.
# der Ordner enthält ein bash Script mit dem selben namen des Ordners
# das Script enthält eine execute Funktion, das Plugin ruft sich am Ende des Skripts selbst auf
