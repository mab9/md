#!/bin/bash


mdConfigFile=${HOME}/.md
workingProject=$(cat $mdConfigFile | grep -i working-project | cut -d "=" -f 2)
sourceDir=$(cat $mdConfigFile | grep -i source-dir | cut -d "=" -f 2)


export MD_INSTALLATION_FOLDER="${HOME}/development/source/md"
MD_SCRIPTS=${MD_INSTALLATION_FOLDER}/scripts

function md() {
  ${MD_INSTALLATION_FOLDER}/md.sh $@
}

# start lunatic mail server
alias start-lunatic="java -jar ${HOME}/development/apps/LunaticSMTP-v0.3.0.jar &" # todo add it into startup script

alias goto-svv-src="cd ${sourceDir}/svvstatistikserver"
alias goto-dab-src="cd ${sourceDir}/dabbawala"
alias goto-md-src="cd ${MD_INSTALLATION_FOLDER}"
alias goto-cs-src="cd ${sourceDir}/cheatsheets"

# describe pods, example: desc-pod core-0
alias desc-pod="kubectl describe pods"

# list pods
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
alias del-cluster="bash $MD_SCRIPTS/delete-cluster.sh"      # todo add to md del ?
alias inst-cluster="bash $MD_SCRIPTS/install-cluster.sh"
alias h-start="bash $MD_SCRIPTS/helm-start.sh"
alias h-upgrade="bash $MD_SCRIPTS/helm-upgrade.sh"
alias m-start="bash $MD_SCRIPTS/minikube-start.sh"
alias m-stop="minikube stop"

#status about the currently deploying pods in kubectl
alias pod-states="bash $MD_SCRIPTS/show-pod-deployment-states.sh"

alias store-git-cred='sed -i '\''7 s/#//'\'' ~/.gitconfig'
alias unstore-git-cred='sed -i '\''7 s/^/#/'\'' ~/.gitconfig'

function show-helm-template() {
  tmp="${sourceDir}/${workingProject}/statistikserver-deployment/docker/helm/statistikserver"
  eval pushd $tmp
  helm template . --values local-values.yaml
  popd
}

# set minikube docker env to the bash, minikube has to be started to set the docker env.
function set-dockerenv() {
  eval $(minikube docker-env)
}

# change the Java version
alias change-javav="sudo update-alternatives --config java"

# list local values
function lslv() {
  tmp="cat ${sourceDir}/${workingProject}/statistikserver-deployment/docker/helm/statistikserver/local-values.yaml"
  eval $tmp
}
