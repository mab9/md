
MD_INSTALLATION_FOLDER="${HOME}/development/source/md"


# Check if the md framework is already installed. If yes then abort the installation.
#
function validateThatMdIsNotInstalled() {
  if grep -iq md/scripts/functions.sh ~/.bashrc; then
    printf "The md framework is already installed.\nRun the framework with the command: md\n\n" && exit
  fi
}

function addBashrcEntry() {
  if test -f ~/.bashrc; then
    printf "\n# md registration" >> ~/.bashrc
    printf "\nsource ${MD_INSTALLATION_FOLDER}/scripts/functions.sh" >> ~/.bashrc
  else
    printf "You have no .bashrc file in your home folder.\n You will have to do the installation by your self.\n\n"
  fi
}

function addMdConfigFile() {
  if [ ! -f ~/.md ]; then
    read -p "The config file is already present, do you want to override it? " yn
    case $yn in
        [Yy]* ) printf "Overriding the md config file.\n" && createMdConfigFile;;
        [Nn]* ) printf "Reusing the config file.\n\n";;
        * ) printf "Please answer yes or no.\n";;
    esac
  fi
}

function createMdConfigFile() {
  read -p "Please provide the path to your source directory: " path
  echo $path
  printf "source-dir=${path}\n" > ~/.md

  printf "working-project=\n" >> ~/.md
  printf "\nPlease chose your working-project:\n"
  bash $MD_INSTALLATION_FOLDER/core/config/config.sh -w -w

  printf "\nThe md config file ~/.md was created\n"
}


validateThatMdIsNotInstalled
addMdConfigFile
addBashrcEntry
chmod 755 ${MD_INSTALLATION_FOLDER}
source ${HOME}/.bashrc

printf "The md framework is installed.\n"
