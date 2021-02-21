#/usr/bin/env bash

######
#
# https://iridakos.com/programming/2018/03/01/bash-programmable-completion-tutorial
#
#    we used the -W (wordlist) option to provide a list of words for completion.
#    we defined to which “program” these completion words will be used (the dothis parameter)

# manual command to complete
# complete -W "cmdanalyse config gen vak lf mvn gotos dep-frontend ssh svv sshuttle version help" md


# complete core items
items=($(ls ${MD_INSTALLATION_FOLDER}/core | grep -v frameworks | xargs))
coreItems=${items[@]}

# complete plugin items
pluginFolder=${MD_INSTALLATION_FOLDER}/plugins/*-plugins/*
plugins=($(ls -d ${pluginFolder} | egrep -iv "readme|license" | xargs -n 1 basename))
pluginItems=${plugins[@]}

complete -W "${coreItems} ${pluginItems} version help" md