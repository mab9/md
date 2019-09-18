minikube start --memory 7120

kubectl create clusterrolebinding --serviceaccount=kube-system:default --clusterrole=cluster-admin default-sa-cluster-admin
kubectl --namespace=kube-system get pod | grep ^kubernetes-dashboard | awk '{print $1}' | xargs kubectl delete pod --namespace=kube-system

kubectl create serviceaccount tiller --namespace kube-system
kubectl create clusterrolebinding --serviceaccount=kube-system:tiller --clusterrole=cluster-admin tiller
helm init --service-account tiller
minikube addons enable ingress


minikubeip=`minikube ip`
if [[ $minikubeip == *"192.168.99.100"* ]]; then
  echo -e "Minikube IP $minikubeip has not changed. Mount the storage with the command:\nminikube mount ~/statistikserver:/documentstorage"

else
   echo -e "Minikube IP  has changed. Use $minikubeip IP  in \n/home/mab/development/source/svvstatistikserver/statistikserver-deployment/docker/helm/statistikserver/local-values.yaml \n /etc/hosts"
fi
