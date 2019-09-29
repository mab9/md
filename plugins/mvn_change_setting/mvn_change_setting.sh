######
# Change the default mvn setting, so that it can be used without
# explicit declaration.
#
# List all mvn settings located at the default place,
# let the user choose a config file and replace the default setting.
#

function execute() {
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

execute