#! /bin/bash

# skript könnte erweitert werden mit noise to > /dev/null 2>&1  und mit einem start parameter wo alles geloggt wird.

eval $(minikube docker-env)
cd ~/development/source/svvstatistikserver/statistikserver-frontend
mvn clean install -DskipTests
kubectl cp ~/development/source/svvstatistikserver/statistikserver-frontend/target/statistikserver-frontend-*.zip default/frontend-0:/app/plugin/statistikserver-frontend-plugin.zip
kubectl exec -it frontend-0 /installPlugin.sh
