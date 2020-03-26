# todo make mount automatic..

minikube start --kubernetes-version=1.15.4 --memory 10000
#minikube start --memory 7120
echo -e "\n\nmount storage with command: \nminikube mount ~/statistikserver:/documentstorage"
