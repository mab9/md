# mabs functions
#------------------------------------------------------------------------------

function use-svv-settings () {  ##                - set svv mvn settings as default setting
  cp ~/.m2/settings-svv.xml ~/.m2/settings.xml
  echo -e "mvn does use the SVV settings\\n"
}

function use-dab-settings () { ##                - set dabbawala mvn settings as default setting
  cp ~/.m2/settings-dab.xml ~/.m2/settings.xml
  echo -e "mvn does use the DAB settings\\n"
}

function start-lunatic () { ##                   - start mail server lunatic
  java -jar ${HOME}development/apps/LunaticSMTP-v0.3.0.jar &
}

function go-to-svv-src () { ##                   - cd to source svvstatistikserver
  cd $SVV_PROJECT
}

function go-to-dab-src () { ##                   - cd to source dabbawala
  cd ~/development/source/dabbawala
}

function mcis() { ##                             - mvn clean install
  mvn clean install -DskipTests
}

function del-cluster() { ##                      - stop and delete minkube and kubernetes
  bash $SVV_SCRIPTS/delete-cluster.sh
}

function inst-cluster() { ##                     - install and start minikube
  bash $SVV_SCRIPTS/install-cluster.sh
}

function h-start() { ##                          - start helm and deploy svv
  bash $SVV_SCRIPTS/helm-start.sh
}

function h-upgrade() { ##                        - upgrade helm and build deps
  bash $SVV_SCRIPTS/helm-upgrade.sh
}
for var in "$@"
  do
      kubectl describe pods "$var"
  done
function m-start() { ##                          - start minikube
  bash $SVV_SCRIPTS/minikube-start.sh
}

function m-stop() { ##                           - stopp minikube
  minikube stop
}

function dep-frontend() { ##                     - deploy svv frontend into kubernets
  bash $SVV_SCRIPTS/deploy-frontend-v1.sh
}

function run-pods() { ##                         - status about the running pods in kubectl
  bash $SVV_SCRIPTS/show-pod-deployment-states.sh
}

function show-helm-template() { ##               - show generated helm template
  pushd $SVV_PROJECT/statistikserver-deployment/docker/helm/statistikserver
  helm template . --values local-values.yaml
  popd
}

function set-dockerenv() { ##                    - set minikube docker env
    eval $(minikube docker-env)
}

function gen-core() { ##                         - mvn clean install svv core module
  echo depricated
  exit
  set-dockerenv
  pushd $SVV_PROJECT/statistikserver-core
  mcis
  popd
}

function gen-workflow() { ##                     - mvn clean install svv workflow module
  echo depricated
  exit
  set-dockerenv
  pushd $SVV_PROJECT/statistikserver-mfh-workflow
  mcis
  popd
}

function change-javav() { ##                     - change the Java version
	sudo update-alternatives --config java
}

function del-pods() { ##                         - force delete kubernetes pods - provide pod name as argument

  echo depricated
  exit
  for var in "$@"
  do
      kubectl delete po "$var" --force --grace-period=0
  done
  bash $SVV_SCRIPTS/show-pod-deployment-states.sh
}

function desc-pods() { ##                        - Describe commands with verbose outputs - provide pod name as argument
  for var in "$@"
  do
      kubectl describe pods "$var"
  done
}

function lsp() { ##                              - List kubectl pods - kubectl get pods
  kubectl get pods
}

alias gen-asciidoc="asciidoctor -a data-uri -a allow-uri-read"
alias json=jq

function lslv() { ##                             - Show SVV local values
  cat $SVV_PROJECT/statistikserver-deployment/docker/helm/statistikserver/local-values.yaml
}

function lsf() {
  echo -e '\n'
  cat ~/.bashrc | grep -i "##" | sed -e 's/ { *##//g' | sed -e 's/function/-/g' | grep -v 'cat ~/.bashrc'
}

function mab() { ##                              - use mab's framework
  bash $SVV_SCRIPTS/mab.sh $@
}

function svv-kubectl-google-cloud-config { ##    - configurate the google cloud auth  for the svv project
  gcloud config set project bedag-svv
  gcloud config set compute/zone europe-west1-d
  gcloud config set compute/region europe-west1
  echo "Enter your gmail user to login to gcloud."
  read line
  gcloud auth login ${line}
  gcloud container clusters get-credentials svv-cluster --zone europe-west1-d --project bedag-svv
}