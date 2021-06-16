#!/bin/bash

if command -v kubectl &> /dev/null
then
    #echo "COMMAND found and will be configured"

    # kubectl autocompletion
    source <(kubectl completion bash)

    alias k=kubectl
    complete -F __start_kubectl k

    #alias sk=kubectl
    #complete -F __start_kubectl sk

    alias kall="kubectl delete po --all --grace-period=0 --force"
    alias kversions="kubectl describe pods | grep -i image: -B 2 | grep -i bedag -B 2"


    # set minikube docker env to the bash, minikube has to be started to set the docker env.
    function set-docker-env {
      eval $(minikube -p minikube docker-env)
    }

    function kwatch() {
      watch -n 1 kubectl get pods
    }

fi


if command -v helm &> /dev/null
then
  # helm autocompletion
  alias h=helm
  source <(helm completion bash)
fi


if command -v docker &> /dev/null
then
  # register docker
  alias d=docker
fi
