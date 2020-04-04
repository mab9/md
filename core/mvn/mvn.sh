######
#
# Change default mvn settings with prepared settings.
# Locate mvn settings with the key word settings and label at the default location  ~/.m2.
# All files containing settings key word will be configurable as default setting. Therefore
# the default file settings.xml is replaced with the choosen one.

function changeSetting() {
  echo "Select new default mvn setting"
  echo ""
  settings=( $(ls ~/.m2/ | grep -i settings) )
  settings+=(exit)

  select setting in "${settings[@]}"; do
      [[ $setting == exit ]] && break

      ## break if value is between the size of the array
      if [[ "$setting" < "${#settings[@]}" ]] ; then
        echo You have to chose a number between 1 and ${#settings[@]}
      else
        # actualize the mvn setting
        cp ~/.m2/${setting} ~/.m2/settings.xml
        echo "You have chosen and configured the mvn setting: $setting"
        exit
      fi
    done
}

function listSettings() {
  echo "List all mvn settings located at the default path ~/.m2"
  echo ""
  ls ~/.m2 | grep -i settings
}

function instructions() {
  echo "Options:"
  echo "  -c | --change-setting:      Change mvn setting"
  echo "  -l | --list-settings:       List mvn settings"
  echo "       --help:                Show help"
  echo ""
  echo "Usage:"
  echo "  md mvn [Options]"
  echo ""
}

function error() {
  echo "Examples: md mvn -c"
  echo ""
  instructions
}

function help() {
  echo "Help"
  echo ""
  instructions
}

function executeDefaults() {
  command="$2" # second layer

  case $command in
      --change-setting|-c)
          changeSetting
          ;;
      --list-settings|-l)
          listSettings
          ;;
      --help)
          help
          ;;
      *)
          error
          ;;
  esac
}

executeDefaults $@
