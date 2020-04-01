#!/bin/bash

# kubectl autocompletion
source <(kubectl completion bash)

alias k=kubectl
complete -F __start_kubectl k

# helm autocompletion
source <(helm completion bash)

