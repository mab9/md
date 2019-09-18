
MD_INSTALLATION_FOLDER="${HOME}/development/source/md/md.sh"
#MD_INSTALLATION_FOLDER="${HOME}/development/apps/md/md.sh"

# Check if the user has bashrc file for the installation.
function installMd() {
  if test -f ~/.bashrc; then
    printf "function md() { %s }\n" "${MD_INSTALLATION_FOLDER}" >> ~/.bashrc
    chmod 755 ${MD_INSTALLATION_FOLDER}
  else
    printf "You have no .bashrc file in your home folder. You will have to do the installation by your self."
  fi
}

# Check if the md framework is already installed.
function validateThatMdIsNotInstalled() {
  if grep -iq md/md.sh ~/.bashrc; then
    printf "The md framework is already installed. Run the framework with the command md.\n\n" && exit
  fi
}

# Ask the user if he is ok for an installation of the md framework in the bashr folder.
function runInstallation() {
    validateThatMdIsNotInstalled

    while true; do
      read -p "Do you wish to install this programm by adding a function to your bashrc file? " yn
      case $yn in
          [Yy]* ) printf "Install the md framework\n\n" && installMd && exit;;
          [Nn]* ) printf "You will have to install the md framework by your own.\n\n" && exit;;
          * ) printf "Please answer yes or no.\n";;
      esac
    done
    source ${HOME}/.bashrc
}

runInstallation
