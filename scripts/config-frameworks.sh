#!/bin/bash


alias pentaho.metadata-editor='bash /home/mab/development/apps/pentaho/metadata-editor/metadata-editor.sh'
alias pentaho.spoon='pentaho-data-integration-spicule.spoon'
alias pentaho.report-designer='bash /home/mab/development/apps/pentaho/report-designer/report-designer.sh'

function kwatch() { 
    watch -n 1 kubectl get pods
}




# kubectl autocompletion
source <(kubectl completion bash)

alias k=kubectl
complete -F __start_kubectl k

# helm autocompletion
source <(helm completion bash)

