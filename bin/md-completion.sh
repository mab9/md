#/usr/bin/env bash


######
#
# https://iridakos.com/programming/2018/03/01/bash-programmable-completion-tutorial
#
#    we used the -W (wordlist) option to provide a list of words for completion.
#    we defined to which “program” these completion words will be used (the dothis parameter)

complete -W "cmdanalyse config gen vak lf mvn gotos dep-frontend ssh svv sshuttle version help" md