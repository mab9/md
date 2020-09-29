# md mab development framework
Some ideas why I have started this project: 

- The md framework is extendable via plugins. Everyone can extend and improve his workflow with new functions. 
- Use the created libs / scripts on multiple systems. Yes, I am able to sync via Github my own functions / plugins
- Create scripts for repeated tasks

## Ideas, todos, next steps

- separate personal plugins into own folder / repository.
- make a first version and tag it.
- Make core scripts generic
- add md autocompletion
- Extend the use of the working directory
- Test Installation script

## Documentation

- The md framework is extendable via plugins.

### Conventions

- List plugin within the "md" execution. The plugin name is used for the plugin folder and entry script. 
   - plugin/demo
   - plugin/demo/demo.sh
- Source all resource.sh files within the md folder will be sourced. See scripts/register.sh 

### Examples

Change the mvn setting to work within a different project and mvn config.

**md mvn -c** 

*** 
Select new default mvn setting

1) settings-dab.xml	   3) settings-security.xml  5) settings.xml
2) settings-empty.xml  4) settings-svv.xml	    6) exit
***
 

## Bash best practices 
https://codeburst.io/13-tips-tricks-for-writing-shell-scripts-with-awesome-ux-19a525ae05ae

 

