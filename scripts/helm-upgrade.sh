
mdConfigFile=${HOME}/.md
workingProject=$(cat $mdConfigFile | grep -i working-project | cut -d "=" -f 2)
sourceDir=$(cat $mdConfigFile | grep -i source-dir | cut -d "=" -f 2)
MD_SCRIPTS=${MD_INSTALLATION_FOLDER}/scripts

tmp="cd ${sourceDir}/${workingProject}/statistikserver-deployment/docker/helm/statistikserver"
eval $tmp

helm upgrade statserver . --values local-values.yaml > /dev/null
bash $MD_SCRIPTS/show-pod-deployment-states.sh
