
## https://misc.flogisoft.com/bash/tip_colors_and_formatting

VERSION=0.0.1

# Define the colors
TITLE="\e[1m"
TITLE_CLEAN="\e[0m"
SUBTITLE="\e[34m"
#SUBTITLE="\e[1m"
COMMAND="\e[94m"
#COMMAND="\e[32m"
CLEAN="\e[0m"

## BLUE 34mBlue
## LIGHT BLUE 94mLight blue"

## this function must be implemented into the mab framework
function helpme () {
    echo -e ""
    echo -e "---------------------------------------------------------------------"
    echo -e "${TITLE}md framework help ${TITLE_CLEAN}"
    echo -e "---------------------------------------------------------------------"
    echo -e ""
    echo -e "${SUBTITLE}Usage:${CLEAN}  ${COMMAND}md <Command>${CLEAN}"
    echo -e ""
    echo -e "${SUBTITLE}Commands for development environment${CLEAN}"
    echo -e ""
    echo -e "${SUBTITLE}General commands${CLEAN}"
    echo -e ""
    echo -e "        ${COMMAND}about${CLEAN}         Show the general information"
    echo -e "        ${COMMAND}help${CLEAN}          Show this help"
    echo -e "        ${COMMAND}version${CLEAN}       Show the version"
    echo -e ""
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





## use the following mvn settings
# . make shure the maven settings path is set
# . make shure the maven setting that will be used is found in the /developement/config folder
# . change the maven setting
#
## change default maven setting
# . list all mvn settings
# . choose one of them
# . set as the default


function mvn_settings_change() {
  settings=( $(ls ~/.m2/ | grep -i settings) )
  settings+=(exit)
  echo yey ${#settings[@]}

  select setting in "${settings[@]}"; do
      [[ $setting == exit ]] && break

      ## break if value is between the size of the array
      if [[ "$setting" < "${#settings[@]}" ]] ; then
        echo You have to chose a number between 1 and ${#settings[@]}
      else
        # actualize the mvn setting
        echo "You have chosen: $setting"
        exit
      fi
    done
}


function version() {
  echo "MD version ${VERSION}"
}

helpme
selectTest
