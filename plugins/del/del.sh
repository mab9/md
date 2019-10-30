#!/bin/bash

function listPods() {
  kubectl get pods
  echo ""
}

function deleteAll() {
  echo "Delete all pods of the current kubernets namespace. "
  echo ""
  kubectl get po | cut -d ' ' -f 1 | while read -r line ; do
      test $i -eq 1 && ((i=i+1)) && continue  ## to skip first line

      kubectl delete po "$line" --force --grace-period=0
      echo "Pod: $line was deleted."
  done
  bash $SVV_SCRIPTS/show-pod-deployment-states
}


function deletePod() {
  echo "Delete pods of the current kubernets namespace. "
  echo ""

  cnt=0 ## to check if the scirpt runningPods has to be executed
  i=1 ## to skip the first line

  kubectl get po | cut -d ' ' -f 1 | while read -r line ; do
      test $i -eq 1 && ((i=i+1)) && continue  ## to skip first line

      ## iteriere über jedes Argument
      for pod in "$@"
      do
         :

        ## prüfe ob der Pod vom Argument vorhanden ist und lösche es
         case $line in
           *"$pod"*)
              cnt=cnt+1  ## does not work inside this fancy loop
              echo ""
              #echo "in loop ${cnt}"
              echo "Delete pod: $line"
              kubectl delete po "$line" --force --grace-period=0
             ;;
         esac
      done

      # todo add pod not found and invoke error function
  done

  echo $cnt ## change the scope of the variable inside the loops...

  bash $SVV_SCRIPTS/show-pod-deployment-states
  #if [ "$cnt" -gt "0" ]; then
  #   echo "hejo"
  #   bash $SVV_SCRIPTS/show-pod-deployment-states
  #fi
  #else
  #  echo ""
  #  echo "No argument matched a pod from current namespace"
  #fi
}

function instructions() {
  echo "Options:"
  echo "  -l | --list-pods:      List all kubectl pods for the working project"
  echo "  -a | --all:            Delete all running pods"
  echo "  -p | --pod             Delete pod that contains the string that is passed by the argument"
  echo "       --help            Show help"
  echo ""
  echo "Usage:"
  echo "  md del [Options] [Pod Name]"
  echo ""
}

function error() {
  echo "Examples: md del -p camunda"
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
      --list-pods|-l)
          listPods
          ;;
      --all|-a)
          deleteAll
          ;;
      --help)
          help
          ;;
      --pod|-p)
          deletePod $@
          ;;
      *)
          error
          ;;
  esac
}

executeDefaults $@