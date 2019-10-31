
mdConfigFile=/home/mab/.md
workingProject=$(cat $mdConfigFile | grep -i working-project | cut -d "=" -f 2)
sourceDir=$(cat $mdConfigFile | grep -i source-dir | cut -d "=" -f 2)start=`date +%s`

while
    runningPods=$(kubectl get pods | grep -i "1/1     Running" | wc -l)
    (( $runningPods < 7 ))
do
    clear
    echo "Running pods: $runningPods/7"
    echo ""
    echo "`kubectl get pods`"

    error=$(kubectl get pods | grep -E -i 'error|backoff|ErrImagePull')

    if [ ! -z "$error" -a "$error" != " " ]; then
        echo ""
        echo "Error Error Error Error Error Error Error Error Error Error Error"
        echo ""
        echo "`cat ${sourceDir}/${workingProject}/statistikserver-deployment/docker/helm/statistikserver/local-values.yaml | grep imagetag`"
        echo ""
        echo "`minikube ssh 'docker images'`"
        sleep 6
    fi
    sleep 3
done

end=`date +%s`
runtime=$((end-start))

echo ""
if [ ! -z "$error" -a "$error" != " " ]; then
  echo "$runningPods pods are up and running, execute time $runtime seconds. Using images from master."
else
  echo "$runningPods pods are up and running, execute time $runtime seconds. Using images from master and overwriting:"
  runningImages=$(cat ${sourceDir}/${workingProject}/statistikserver-deployment/docker/helm/statistikserver/local-values.yaml | grep -i image)
  echo "$runningImages"
fi
