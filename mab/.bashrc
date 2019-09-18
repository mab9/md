# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolorcom.sun:tools:jar:1.7.0s -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# mabs functions
#------------------------------------------------------------------------------

function use-svv-settings () {  ##                - set svv mvn settings as default setting
  cp ~/.m2/settings-svv.xml ~/.m2/settings.xml
  echo -e "mvn does use the SVV settings\\n"
}

function use-dab-settings () { ##                - set dabbawala mvn settings as default setting
  cp ~/.m2/settings-dab.xml ~/.m2/settings.xml
  echo -e "mvn does use the DAB settings\\n"
}

function start-lunatic () { ##                   - start mail server lunatic
  java -jar /home/mab/development/apps/LunaticSMTP-v0.3.0.jar &
}

function go-to-svv-src () { ##                   - cd to source svvstatistikserver
  cd $SVV_PROJECT
}

function go-to-dab-src () { ##                   - cd to source dabbawala
  cd ~/development/source/dabbawala
}

function mcis() { ##                             - mvn clean install
  mvn clean install -DskipTests
}

function del-cluster() { ##                      - stop and delete minkube and kubernetes
  bash $SVV_SCRIPTS/delete-cluster.sh
}

function inst-cluster() { ##                     - install and start minikube
  bash $SVV_SCRIPTS/install-cluster.sh
}

function h-start() { ##                          - start helm and deploy svv
  bash $SVV_SCRIPTS/helm-start.sh
}

function h-upgrade() { ##                        - upgrade helm and build deps
  bash $SVV_SCRIPTS/helm-upgrade.sh
}
for var in "$@"
  do
      kubectl describe pods "$var"
  done
function m-start() { ##                          - start minikube
  bash $SVV_SCRIPTS/minikube-start.sh
}

function m-stop() { ##                           - stopp minikube
  minikube stop
}

function dep-frontend() { ##                     - deploy svv frontend into kubernets
  bash $SVV_SCRIPTS/deploy-frontend-v1.sh
}

function run-pods() { ##                         - status about the running pods in kubectl
  bash $SVV_SCRIPTS/runningPods.sh
}

function show-helm-template() { ##               - show generated helm template
  pushd $SVV_PROJECT/statistikserver-deployment/docker/helm/statistikserver
  helm template . --values local-values.yaml
  popd
}

function set-dockerenv() { ##                    - set minikube docker env
    eval $(minikube docker-env)
}

function gen-core() { ##                         - mvn clean install svv core module
  echo depricated
  exit
  set-dockerenv
  pushd $SVV_PROJECT/statistikserver-core
  mcis
  popd
}

function gen-workflow() { ##                     - mvn clean install svv workflow module
  echo depricated
  exit
  set-dockerenv
  pushd $SVV_PROJECT/statistikserver-mfh-workflow
  mcis
  popd
}

function change-javav() { ##                     - change the Java version
	sudo update-alternatives --config java
}

function del-pods() { ##                         - force delete kubernetes pods - provide pod name as argument

  echo depricated
  exit
  for var in "$@"
  do
      kubectl delete po "$var" --force --grace-period=0
  done
  bash $SVV_SCRIPTS/runningPods.sh
}

function desc-pods() { ##                        - Describe commands with verbose outputs - provide pod name as argument
  for var in "$@"
  do
      kubectl describe pods "$var"
  done
}

function lsp() { ##                              - List kubectl pods - kubectl get pods
  kubectl get pods
}

alias gen-asciidoc="asciidoctor -a data-uri -a allow-uri-read"
alias json=jq

function lslv() { ##                             - Show SVV local values
  cat $SVV_PROJECT/statistikserver-deployment/docker/helm/statistikserver/local-values.yaml
}

function lsf() {
  echo -e '\n'
  cat ~/.bashrc | grep -i "##" | sed -e 's/ { *##//g' | sed -e 's/function/-/g' | grep -v 'cat ~/.bashrc'
}

function mab() { ##                              - use mab's framework
  bash $SVV_SCRIPTS/mab.sh $@
}

function svv-kubectl-google-cloud-config { ##    - configurate the google cloud auth  for the svv project
  gcloud config set project bedag-svv
  gcloud config set compute/zone europe-west1-d
  gcloud config set compute/region europe-west1
  echo "Enter your gmail user to login to gcloud."
  read line
  gcloud auth login ${line}
  gcloud container clusters get-credentials svv-cluster --zone europe-west1-d --project bedag-svv
}


# mabs default exports
#------------------------------------------------------------------------------
export PATH=/home/mab/development/apps/apache-maven-3.6.0/bin:$PATH
export PATH=/home/mab/development/apps/camunda-modeler:$PATH
export PATH=/home/mab/development/apps/pentaho/data-integration:$PATH
export PATH=/home/mab/development/apps/pentaho/report-designer:$PATH
export SVV_SCRIPTS=/home/mab/Documents/svv/scripts
export SVV_PROJECT=/home/mab/development/source/svvstatistikserver

export JAVA_HOME=/home/mab/development/apps/jdk1.8.0_201
export JAVA_JRE=/home/mab/development/apps/jdk1.8.0_201/jre

#export JAVA_HOME="/home/mab/development/apps/jdk-11.0.2"
#export JAVA_JRE=/home/mab/development/apps/jdk-11.0.2/jre

export PATH=$PATH:${JRE_HOME}/bin
export PATH=$PATH:${JAVA_HOME}/bin

export PATH=/snap/bin:$PATH

# dab kak konfig
USERPROFILE=/home/mab


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion



# mabs default config
#------------------------------------------------------------------------------

use-svv-settings

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/mab/Downloads/google-cloud-sdk/path.bash.inc' ]; then . '/home/mab/Downloads/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/mab/Downloads/google-cloud-sdk/completion.bash.inc' ]; then . '/home/mab/Downloads/google-cloud-sdk/completion.bash.inc'; fi
