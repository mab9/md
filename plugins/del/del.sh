#!/bin/bash

function deleteAll() {
  echo "Delete all pods of the current kubernets namespace. "
  echo ""
  kubectl get po | cut -d ' ' -f 1 | while read -r line ; do
      test $i -eq 1 && ((i=i+1)) && continue  ## to skip first line

      kubectl delete po "$line" --force --grace-period=0
      echo "Pod: $line was deleted."
  done
  bash $SVV_SCRIPTS/runningPods.sh
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

  bash $SVV_SCRIPTS/runningPods.sh
  #if [ "$cnt" -gt "0" ]; then
  #   echo "hejo"
  #   bash $SVV_SCRIPTS/runningPods.sh
  #fi
  #else
  #  echo ""
  #  echo "No argument matched a pod from current namespace"
  #fi


}

function error() {
  echo "Examples: md del camunda, md del -a"
  echo ""
  echo "Options:"
  echo "  -a | --all: delete all running pods"
  echo "  *         : delete pod containgig string that is passed by the argument"
  echo ""
  echo "Usage:"
}

function help() {
  echo "help"
}


function executeDefaults() {
  command="$2" # second layer

  case $command in
      --all|-a)
          deleteAll
          ;;
      --help)
          help
          ;;
      "")
        error
        ;;
      *)
        deletePod $@
        ;;
  esac
}

executeDefaults $@