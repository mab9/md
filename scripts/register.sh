#!/bin/bash

export MD_INSTALLATION_FOLDER="${HOME}/development/source/md"
MD_SCRIPTS=${MD_INSTALLATION_FOLDER}/scripts

# expose md framework
function md() {
  ${MD_INSTALLATION_FOLDER}/md $@
}

## find all resource files and source them

allResourcePaths=$(find ${MD_INSTALLATION_FOLDER} -name "resource.sh")

for path in ${allResourcePaths[@]}; do
  source $path
done

source ${MD_SCRIPTS}/config-functions.sh
source ${MD_SCRIPTS}/git-completion.sh


## completion and bin folder
source ${MD_INSTALLATION_FOLDER}/bin/md-completion.sh
export PATH=$PATH:${MD_INSTALLATION_FOLDER}/bin
