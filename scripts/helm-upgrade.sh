
mdConfigFile=/home/mab/.md
workingProject=$(cat $mdConfigFile | grep -i working-project | cut -d "=" -f 2)
sourceDir=$(cat $mdConfigFile | grep -i source-dir | cut -d "=" -f 2)

SVV_SCRIPTS=${MD_INSTALLATION_FOLDER}/scripts

cd ~${sourceDir}/${workingProject}/statistikserver-deployment/docker/helm/statistikserver

helm upgrade statserver . --values local-values.yaml > /dev/null
kubectl get pods
echo "" # new line for better layout
bash $SVV_SCRIPTS/show-pod-deployment-states.sh
