#!/bin/bash

# todo replace those functions into dediacted plugins!


mdConfigFile=${HOME}/.md
workingProject=$(cat $mdConfigFile | grep -i working-project | cut -d "=" -f 2)
sourceDir=$(cat $mdConfigFile | grep -i source-dir | cut -d "=" -f 2)

# start lunatic mail server
alias start-lunatic="java -jar ${HOME}/development/apps/LunaticSMTP-v0.3.0.jar &" # todo add it into startup script
alias weather="curl wttr.in/Bern"
alias start-mailhog="sudo docker run -d -p 1025:1025 -p 8025:8025 mailhog/mailhog"

# uses the default settings.xml ... the one chosen with mvn_change_setting
alias mcis="mvn clean install -DskipTests"

# change the Java version
alias change-javav="sudo update-alternatives --config java"

alias c="clear"
#docker images | grep -i $1 | awk '{print $3}' | xargs docker rmi;"

# https://www.maketecheasier.com/run-bash-commands-background-linux/ open in the background
alias pentaho.spoon='nohup pentaho-data-integration-spicule.spoon &>/dev/null &'
alias pentaho.report-designer='nohup bash /home/mab/development/apps/pentaho/report-designer/report-designer.sh &>/dev/null &'
alias pentaho.metadata-editor='nohup bash /home/mab/development/apps/pentaho/metadata-editor/metadata-editor.sh &>/dev/null &'
alias pentaho.server-7.1.0.0-12='nohup bash /home/mab/development/apps/pentaho/pentaho-server-7.1.0.0-12/start-pentaho.sh &>/dev/null &'
alias pentaho.server-8.2.0.0-342='nohup bash /home/mab/development/apps/pentaho/pentaho-server-8.2.0.0-342/start-pentaho.sh &>/dev/null &'



alias gs="git status"
alias gp="git pull"
alias gc="git commit"
alias gaall="git add ."