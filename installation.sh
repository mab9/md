
MD_INSTALLATION_FOLDER="${HOME}/development/source/md"
MD_CONFIG_FILE="${HOME}/.md"

function validateThatMdIsNotInstalled() {
  if grep -iq ${MD_INSTALLATION_FOLDER}/scripts/register.sh ~/.bashrc;
  then
    printf "The md framework is already installed.\nRun the framework with the command: md\n\n" && exit
  fi
}

function addMdConfigFile() {
  if [ -e ${MD_CONFIG_FILE} ]; ## check if file exists
  then
    read -p "The config file is already present, do you want to override it? " yn
    case $yn in
        [Yy]* ) printf "Overriding the md config file.\n" && createMdConfigFile;;
        [Nn]* ) printf "Reusing the config file.\n\n";;
        * ) printf "Please answer yes or no.\n";;
    esac
  else
    createMdConfigFile
  fi
}

function createMdConfigFile() {
  read -p "Please provide the path to your source directory: " path
  echo $path
  printf "source-dir=${path}\n" > ~/.md

  printf "working-project=\n" >> ~/.md
  printf "\nPlease chose your working-project:\n"
  bash $MD_INSTALLATION_FOLDER/core/config/config.sh -w

  printf "\nThe md config file ~/.md was created\n"
}

function addBashrcEntry() {
  if [ -e ~/.bashrc ]; ## check if file exists
  then
    printf "\n# md registration" >> ~/.bashrc
    printf "\nsource ${MD_INSTALLATION_FOLDER}/scripts/register.sh" >> ~/.bashrc
  else
    printf "You have no .bashrc file in your home folder.\nYou will have to do the installation by your self.\n\n" && exit
  fi
}


validateThatMdIsNotInstalled   ## exit if already installed
addMdConfigFile
addBashrcEntry                 ## exit installation if no .bashrc exists
chmod 755 ${MD_INSTALLATION_FOLDER}
source ${HOME}/.bashrc

printf "The md framework is installed and ready to use.\n"
