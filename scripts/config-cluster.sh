#!/bin/bash


mdConfigFile=${HOME}/.md
workingProject=$(cat $mdConfigFile | grep -i working-project | cut -d "=" -f 2)
sourceDir=$(cat $mdConfigFile | grep -i source-dir | cut -d "=" -f 2)
 
alias kall="kubectl delete po --all --grace-period=0 --force"
alias kversions="kubectl describe pods | grep -i image: -B 2 | grep -i bedag -B 2"


# set minikube docker env to the bash, minikube has to be started to set the docker env.
alias set-docker-env="eval $(minikube -p minikube docker-env)"

alias cluster-delete="bash $MD_SCRIPTS/md-delete-cluster.sh"      # todo add to md del ?
alias cluster-install="bash $MD_SCRIPTS/md-install-cluster.sh"
alias h-refresh="bash $MD_SCRIPTS/md-helm-refresh.sh"
alias h-dep-upgrade="bash $MD_SCRIPTS/md-helm-dep-upgrade.sh"
alias m-start="bash $MD_SCRIPTS/md-minikube-start.sh"
alias m-stop="minikube stop"

function svv-kubectl-google-cloud-config { ##    - configurate the google cloud auth  for the svv project
  gcloud config set project bedag-svv
  gcloud config set compute/zone europe-west1-d
  gcloud config set compute/region europe-west1
  echo "Enter your gmail user to login to gcloud."
  read line
  gcloud auth login ${line}
  gcloud container clusters get-credentials svv-cluster --zone europe-west1-d --project bedag-svv
}






