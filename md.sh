
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

function version() {
  echo "MD version ${VERSION}"
}

helpme
