#!/bin/bash

FILE_DIRECTORY=`dirname "$0"`

function changeKubectlNs() {
  bash $FILE_DIRECTORY/change-kubectl-ns.sh $@
}

function installCluster() {
  bash $FILE_DIRECTORY/install-cluster.sh
}

function startCluster() {
  bash $FILE_DIRECTORY/start-cluster.sh
}

function deleteCluster() {
  bash $FILE_DIRECTORY/delete-cluster.sh
}

function pullLatest() {
  echo "Pull all svv / dab latest images from dockerhub"
  echo ""
  docker login
  docker pull bedag/dabbawala-postgres:latest
  echo ""
  docker pull bedag/dabbawala-keycloak:latest
  echo ""
  docker pull bedag/dabbawala-pentaho:latest
  echo ""
  docker pull bedag/dabbawala-core:latest
  echo ""
  docker pull bedag/dabbawala-camunda:latest
  echo ""
  docker pull bedag/svvstatistikserver-backend:latest
  echo ""
  docker pull bedag/svvstatistikserver-pentaho:latest
  echo ""
  docker pull bedag/svvstatistikserver-keycloak:latest
  echo ""
  docker pull bedag/svvstatistikserver-frontend:latest
  echo ""
  docker pull bedag/svvstatistikserver-core:latest
}

function checkDeployments() {
  echo "Show description of deployed kubernets images and pods"
  echo ""
  kubectl describe pods | egrep -i " core:| frontend:| backend:| pentaho:| camunda:| postgres:| keycloak:" -A 3 | grep -vi container
}

function printMandantInfos() {
  echo "Mandant infos"
  echo ""
  echo "mandant  - g-nr. - mandant id, rollen id                -       umsystem pw enc  - umsystem pw dec" 
  echo "Allianz  - 20026 - 05eba5c9-3801-468e-b863-9227a02b39e3 -	KYc1VRcS+/f53w== - 3IATKK4JW2"
  echo "AXA      - 20056 - de77c56e-2914-4fa6-adc4-434eb7367411 -	K5gsUGppjPbjvw== - 1VXQ60CKMR"
  echo "Baloise  - 20016 - 0479db71-a3ae-4d21-b2e2-bc7f1327365a -	VpckQGwXiuXptA== - LYPA0NEXGY"
  echo "Generali - 20048 - 023e9a85-7dbb-4c32-a1eb-037e283fab8c -	VokxWx1smvHp2Q== - LGEZA5ULG4"
  echo "Helvetia - 20029 - 8f40e4c3-df16-4873-91ea-e48222a4ad93 -	KowiU2gX9uX6qw== - 0BVR4N9XTF"
  echo "Mobiliar - 20034 - 1682206c-4105-4ac2-a7dd-5a5e6e9f6070 -	L4MzVhhhjPLvoQ== - 5MGWD8COAL"
  echo "National - 20038 - 2bf9f9d6-72d9-4fae-a6bf-7988376f64f8 -	SZ04WQhtheSZ3g== - SSLXT4JY73"
  echo "Vaudoise - 20036 - ddaa8a7f-f0b6-4250-99bb-9011f998de39 -	I4VEVxcN+ozrpw== - 9K0VKT51EJ"
  echo "Zürich   - 20060 - 41c6dbea-d160-48ae-9000-6d5db4b55d14 -	Q/5BNmQBnuf4tQ== - Y0578XQZVX"
}

function printCreds() {
  echo "Test Credentials"
  echo ""
  echo "id                 | pw"
  echo "dabbawala          | 9AAwZADKmsorb9eT74Y1jARzBt7Amx"
  echo "knowledgebase      | cWRxUGZueHJFb1E3RHlVVk1JWC1SYz"
  echo "knowledgebaseadmin | qdqPfnxrEoQ7DyUVMIX-Rc67PjlKj1"
}


function instructions() {
  echo "Options:"
  echo "  -c | --credentials-infos:   Show test credentials"
  echo "  -d | --deployments-check:   Grep check if all latest images are up nd running in minikube"
  echo "  -e | --change-ns:           Change kubectl namespace"
  echo "  -i | --install-cluster:     Install svv minikube cluster"
  echo "  -p | --pull-latest:         Pull all svv and dab latest docker images"
  echo "  -r | --remove-cluster:      Stop and delete svv minikube cluster"
  echo "  -s | --start-cluster:       Start svv minikube cluster"
  echo "  -t | --tenant-infos:        Show tenant gesellschafts number, credentials"
  echo "       --help:                Show help"
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
      --credentials-infos|-c)
          printCreds
          ;;
      --change-ns|-e)
          changeKubectlNs $@
          ;;
      --pull-latest|-p)
          pullLatest
          ;;
      --deployments-check|-d)
          checkDeployments
          ;;
      --tenant-infos|-t)
          printMandantInfos
          ;;
      --install-cluster|-i)
          installCluster
          ;;
      --start-cluster|-s)
          startCluster
          ;;
      --remove-cluster|-r)
          deleteCluster
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
