#!/bin/bash

mdConfigFile=${HOME}/.md
sourceDir=$(cat $mdConfigFile | grep -i source-dir | cut -d "=" -f 2)

alias goto-svv-src="cd ${sourceDir}/svvstatistikserver"
alias goto-svv-src-dep="cd ${sourceDir}/svvstatistikserver/statistikserver-deployment/docker/helm/statistikserver"
alias goto-dab-src="cd ${sourceDir}/dabbawala"
alias goto-md-src="cd ${MD_INSTALLATION_FOLDER}"
alias goto-cs-src="cd ${sourceDir}/cheatsheets"
alias goto-ibft-nw="cd ~/IBFT-Network"
alias goto-vakansie-src="cd ~/development/source/vakansie"
alias goto-plansch-src="cd ~/development/source/fhnw/plansch"
