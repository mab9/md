#!/bin/bash


mdConfigFile=/home/mab/.md
workingProject=$(cat $mdConfigFile | grep -i working-project | cut -d "=" -f 2)
sourceDir=$(cat $mdConfigFile | grep -i source-dir | cut -d "=" -f 2)

SVV_SCRIPTS=${MD_INSTALLATION_FOLDER}/scripts

# start lunatic mail server
alias start-lunatic="java -jar /home/mab/development/apps/LunaticSMTP-v0.3.0.jar &"

alias go-to-svv-src="cd ${sourceDir}/svvstatistikserver"
alias go-to-dab-src="cd ${sourceDir}/source/dabbawala"
alias go-to-md-src="cd ${MD_INSTALLATION_FOLDER}"


# example desc-pod core-0
alias desc-pod="kubectl describe pods"
alias lsp="kubectl get pods"


function svv-kubectl-google-cloud-config { ##    - configurate the google cloud auth  for the svv project
  gcloud config set project bedag-svv
  gcloud config set compute/zone europe-west1-d
  gcloud config set compute/region europe-west1
  echo "Enter your gmail user to login to gcloud."
  read line
  gcloud auth login ${line}
  gcloud container clusters get-credentials svv-cluster --zone europe-west1-d --project bedag-svv
}

# uses the default settings.xml ... the one chosed with mvn_change_setting
alias mcis="mvn clean install -DskipTests"
alias del-cluster="bash $SVV_SCRIPTS/delete-cluster.sh"
alias inst-cluster="bash $SVV_SCRIPTS/install-cluster.sh"
alias h-start="bash $SVV_SCRIPTS/helm-start.sh"
alias h-upgrade="bash $SVV_SCRIPTS/helm-upgrade.sh"
alias m-start="bash $SVV_SCRIPTS/minikube-start.sh"
alias m-stop="minikube stop"

#deploy builded svv frontend into kubernets
alias dep-frontend="bash $SVV_SCRIPTS/deploy-frontend-v1.sh"

#status about the currently deploying pods in kubectl
alias pod-states="bash $SVV_SCRIPTS/show-pod-deployment-states.sh"


function show-helm-template() {
  pushd ${sourceDir}/${workingProject}/statistikserver-deployment/docker/helm/statistikserver
  helm template . --values local-values.yaml
  popd
}

# set minikube docker env, minikube has to be started to set the docker env.
function set-dockerenv() {
  bash eval $(minikube docker-env)
}

# change the Java version
alias change-javav="sudo update-alternatives --config java"

function lslv() {
  cat ${sourceDir}/${workingProject}/statistikserver-deployment/docker/helm/statistikserver/local-values.yaml
}