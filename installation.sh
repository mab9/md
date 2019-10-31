
MD_INSTALLATION_FOLDER="${HOME}/development/source/md"


# - check if the user has a bashrc file for the installation
# - add a function to the bashrc file that calls the md.sh script
# - register some alias functions.
# - add a md config file to the user home folder
# - add some exports to the bashr ( some project paths )   todo exprot svv_scripts... impl with read
# - finally reload the bashrc file.
#
function installMd() {
  if test -f ~/.bashrc; then
    printf "\n#############\n# MD Framework \nfunction md() {\n\t %s \$@ \n}\n" "${MD_INSTALLATION_FOLDER}/md.sh" >> ~/.bashrc
    printf "\n\nsource ${MD_INSTALLATION_FOLDER}/scripts/aliases.sh" >> ~/.bashrc
    chmod 755 ${MD_INSTALLATION_FOLDER}
    source ${HOME}/.bashrc
    addMdConfigFile
  else
    printf "You have no .bashrc file in your home folder. You will have to do the installation by your self."
  fi
}

# Check if the md framework is already installed.
#
function validateThatMdIsNotInstalled() {
  if grep -iq md/md.sh ~/.bashrc; then
    printf "The md framework is already installed. Run the framework with the command md.\n\n" && exit
  fi
}

# Validate if the md framework is already installed, if yes then abort the installation.
# Ask the user if he is ok for an installation of the md framework in the bashr folder.
#
function runInstallation() {
    validateThatMdIsNotInstalled

    while true; do
      read -p "Do you wish to install this programm by extending your .bashrc file? " yn
      case $yn in
          [Yy]* ) printf "Install the md framework\n\n" && installMd && exit;;
          [Nn]* ) printf "You will have to install the md framework by your own.\n\n" && exit;;
          * ) printf "Please answer yes or no.\n";;
      esac
    done
}

# Add a md config file to the home folder with the default values
#
function createAndSourceMdConfigFile() {
  printf "working-project=\n" > ~/.md
  printf "source-dir=~/development/source\n" >> ~/.md
  printf "\ncreate config file\n\n"
}

# Check if the md config file is already installed.
#
function addMdConfigFile() {
  if [ ! -f ~/.md ]; then
    read -p "The config file is already present, do you want to override it? " yn
    case $yn in
        [Yy]* ) printf "Overriding the md config file." && createAndSourceMdConfigFile && exit;;
        [Nn]* ) printf "Reusing the config file.\n\n" && exit;;
        * ) printf "Please answer yes or no.\n";;
    esac
  fi
}


# todo export vars / make them dynamic... MD_installation folder .bashrc

addMdConfigFile
runInstallation
