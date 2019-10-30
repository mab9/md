cd ~/development/source/svvstatistikserver/statistikserver-deployment/docker/helm/statistikserver

helm upgrade statserver . --values local-values.yaml > /dev/null
kubectl get pods
echo "" # new line for better layout
bash $SVV_SCRIPTS/show-pod-deployment-states
