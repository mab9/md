#!/bin/bash

currentBranch=`git symbolic-ref HEAD`

echo "Generate modules from branch ${currentBranch}"
echo ""

for var in "$@"
do
  pushd ./statistikserver*$var*
  eval $(minikube docker-env)
  mvn clean install -DskipTests
  popd
done
