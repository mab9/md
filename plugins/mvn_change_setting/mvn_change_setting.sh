## use the following mvn settings
# . make shure the maven settings path is set
# . make shure the maven setting that will be used is found in the /developement/config folder
# . change the maven setting
#
## change default maven setting
# . list all mvn settings
# . choose one of them
# . set as the default

#@!plugin_name: change-mvn-setting

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
        echo "You have chosen: $setting"
        exit
      fi
    done
}

execute