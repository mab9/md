
cd ~/development/source/svvstatistikserver/statistikserver-deployment/docker/helm/statistikserver/

rm requirements.lock
helm del --purge statserver

## Terminate and remove the pods before deploying new ones.

while
    terminatingPods=$(kubectl get pods | grep -i terminating | wc -l)
    (( $terminatingPods > 0 ))
do
    clear
    echo "Terminating pods: $terminatingPods"
    echo ""
    echo "`kubectl get pods | grep -i terminating`"
    sleep 3
done

helm dep build
helm install . --name statserver --values local-values.yaml
echo "Start pod deployments"

bash ./runningPods.sh
