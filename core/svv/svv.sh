#!/bin/bash


#!/bin/bash


function pullLatest() {
  echo "Pull all svv / dab latest images from dockerhub"
  echo ""
  docker login
  docker pull bedag/dabbawala-postgres:latest
  docker pull bedag/dabbawala-keycloak:latest
  docker pull bedag/dabbawala-pentaho:latest
  docker pull bedag/dabbawala-core:latest
  docker pull bedag/dabbawala-camunda:latest
  docker pull bedag/svvstatistikserver-backend:latest
  docker pull bedag/svvstatistikserver-keycloak:latest
  docker pull bedag/svvstatistikserver-frontend:latest
  docker pull bedag/svvstatistikserver-core:latest
}

function checkLatest() {
  echo "Not implemented"
  echo ""

}


function instructions() {
  echo "Options:"
  echo "  -l | --pull-latest:    Pull all svv and dab latest docker images"
  echo "  -c | --check-latest:   Grep check if all latest images are up nd running in minikube"
  echo "       --help            Show help"
  echo ""
  echo "Usage:"
  echo "  md svv [Options]"
  echo ""
}

function error() {
  echo "Examples: md svv -l"
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
      --pull-latest|-l)
          pullLatest
          ;;
      --check-latest|-c)
          checkLatest
          ;;
      --help)
          help
          ;;
      *)
          error
          ;;
  esac
}

executeDefaults $@
