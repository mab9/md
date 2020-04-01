#!/bin/bash

export MD_INSTALLATION_FOLDER="${HOME}/development/source/md"
MD_SCRIPTS=${MD_INSTALLATION_FOLDER}/scripts

function md() {
  ${MD_INSTALLATION_FOLDER}/md.sh $@
}

source ${MD_SCRIPTS}/config-functions.sh
source ${MD_SCRIPTS}/config-frameworks.sh
source ${MD_SCRIPTS}/config-gotos.sh

