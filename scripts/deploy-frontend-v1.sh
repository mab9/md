#! /bin/bash

# skript könnte erweitert werden mit noise to > /dev/null 2>&1  und mit einem start parameter wo alles geloggt wird.

mdConfigFile=${HOME}.md
workingProject=$(cat $mdConfigFile | grep -i working-project | cut -d "=" -f 2)
sourceDir=$(cat $mdConfigFile | grep -i source-dir | cut -d "=" -f 2)


eval $(minikube docker-env)
cd ${sourceDir}/${workingProject}/statistikserver-frontend
mvn clean install -DskipTests
kubectl cp ${sourceDir}/${workingProject}/statistikserver-frontend/target/statistikserver-frontend-*.zip default/frontend-0:/app/plugin/statistikserver-frontend-plugin.zip
kubectl exec -it frontend-0 /installPlugin.sh
