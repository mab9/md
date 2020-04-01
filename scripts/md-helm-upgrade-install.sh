
mdConfigFile=${HOME}/.md
workingProject=$(cat $mdConfigFile | grep -i working-project | cut -d "=" -f 2)
sourceDir=$(cat $mdConfigFile | grep -i source-dir | cut -d "=" -f 2)
MD_SCRIPTS=${MD_INSTALLATION_FOLDER}/scripts

# todo make this generic
tmp="cd ${sourceDir}/${workingProject}/statistikserver-deployment/docker/helm/statistikserver"
eval $tmp

rm requirements.lock
helm3 del --purge statserver

kubectl delete po --all
helm3 dep build
helm3 upgrade --install statserver -f values.yaml -f local-values.yaml .
#bash $MD_SCRIPTS/show-pod-deployment-states.sh
