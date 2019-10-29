#!/bin/bash

echo "Delete pods of current kubernetes namespace"

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
done

echo $cnt

bash $SVV_SCRIPTS/runningPods.sh
#if [ "$cnt" -gt 0 ]; then
#   bash $SVV_SCRIPTS/runningPods.sh
#else
#  echo ""
#  echo "No argument matched a pod from current namespace"
#fi
