
mdConfigFile=${HOME}/.md
workingProject=$(cat $mdConfigFile | grep -i working-project | cut -d "=" -f 2)
sourceDir=$(cat $mdConfigFile | grep -i source-dir | cut -d "=" -f 2)
MD_SCRIPTS=${MD_INSTALLATION_FOLDER}/scripts

tmp="cd ${sourceDir}/${workingProject}/${workingProject}-deployment/docker/helm/${workingProject}"
eval $tmp


helm dep update

echo "You should now do an upgrade of your helm chart and then restart your pod."

#bash $MD_SCRIPTS/show-pod-deployment-states.sh
