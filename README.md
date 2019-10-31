# md

## MD Ideas

- run md on multiple systems. use same scripts on multiple systems
- add plugins, everyone can create theyr own plugin in bash or python or java?


- create scripts for repeated tasks
- easy share of those scripts
- easy installation of plugins in different script or programming languages
- description of those plugins and how to install and how to use the framework


## Ideas, todos, next steps

- some demo use cases and descriptions...
- installation description
- repackaging core and plugin functions
- make scripts generic
- add descriptions and lists of all functions to help
- write some demos and how to's

## demos and how tos
 
### Minikube installation, run application and stop
1. install md, run installation script:              bash installation.sh
2. choose a working project:                         md config -w 
3. generate / build the working project project:     md gen -a
4. install minikube:                                 inst-cluster
5. mount storage:                                    copy, extend, paste code that was printed in your terminal 
6. configure svv kubernetes env:                     h-start
7. use started project.
8. stop minikube:                                    m-stop

### Use a custom module on a running system 

1. Make changes in your chosen module
2. Update your local-values with new version 
3. build module:                                     md gen -m core
4. Upgrade helm template:                            h-upgrade / md h-upgrade (future...)     
5. redeploy it on cluster:                           md del -p core

## Bash best practices 
https://codeburst.io/13-tips-tricks-for-writing-shell-scripts-with-awesome-ux-19a525ae05ae


## Konvention
- plugins werden in einem Ordner abgelegt.
- der Ordner enthält ein bash Script mit dem selben namen des Ordners und .sh 
