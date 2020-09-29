# md

<!--- These are examples. See https://shields.io for others or to customize this set of shields. You might want to include dependencies, project status and licence info here --->
![GitHub repo size](https://img.shields.io/github/repo-size/mab9/md)
![GitHub contributors](https://img.shields.io/github/contributors/mab9/md)
![GitHub stars](https://img.shields.io/github/stars/mab9/md?style=social)
![GitHub forks](https://img.shields.io/github/forks/mab9/md?style=social)
<!--![Twitter Follow](https://img.shields.io/twitter/follow/mab9?style=social)-->

Md is a tool that allows developers to reduce their repetitive tasks.

The tool offers core functions and the possibility to integrate and use self written plugins for the dev workflow.
It aims to make it easier to work on different devices by providing the same functions.

## Prerequisites

Before you begin, ensure you have met the following requirements:
<!--- These are just example requirements. Add, duplicate or remove as required --->
* You have installed the latest version of `<coding_language/dependency/requirement_1>`
* You have a Linux machine or a linux shell.
* You have read `<guide/link/documentation_related_to_project>`.

## Installing md

To install md, follow these steps:

Linux:
```
bash installation.sh
```

## Using md

To use md, follow these steps:

```
1. open a shell
2. enter md command "md"
3. help: md help | md | md -h
```

**Example: use different maven settings.xml files (instead to use a project config ;-))**

```
md mvn -c
 
Select new default mvn setting

1) settings-dab.xml     3) settings-security.xml    5) settings.xml
2) settings-empty.xml   4) settings-svv.xml         6) exit 
```

**Example: Create and use a new plugin. As example, we named the new plugin: magic.**

```
cd ./md/plugins
mkdir ./magic
touch ./magic/magic.sh          // add your script code into the magic.sh file

md magic                        // use the new plugin
```

Have a look [here](https://codeburst.io/13-tips-tricks-for-writing-shell-scripts-with-awesome-ux-19a525ae05ae) for some bash tips and tricks. 

**Example: Add plugin files that shall be [sourced](https://linuxize.com/post/bash-source-command/) and accesible. It is useful to load functions, variables, and configuration files into shell scripts.**

```
touch ./magic/resource.sh       // add a file named resource.sh into your plugin folder
```

All resource.sh files within the md folder will be sourced. See scripts/register.sh 


## Contributing to md
<!--- If your README is long or you have some specific process or steps you want contributors to follow, consider creating a separate CONTRIBUTING.md file--->
To contribute to md, follow these steps:

1. Fork this repository.
2. Create a branch: `git checkout -b <branch_name>`.
3. Make your changes and commit them: `git commit -m '<commit_message>'`
4. Push to the original branch: `git push origin md/<location>`
5. Create the pull request.

Alternatively see the GitHub documentation on [creating a pull request](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request).

## My next ideas

- separate personal plugins into own folder / repository.
- make a first version and tag it.
- Make core scripts generic
- add md autocompletion
- Extend the use of the working directory
- Test Installation script


## Contributors

Thanks to the following people who have contributed to this project:

* [@mab9](https://github.com/mab9) 📖

<!-- You might want to consider using something like the [All Contributors](https://github.com/all-contributors/all-contributors) specification and its [emoji key](https://allcontributors.org/docs/en/emoji-key). -->

## Contact

If you want to contact me you can reach me at **marcantoine.bruelhart@gmail.com.**

## License
<!--- If you're not sure which open license to use see https://choosealicense.com/--->

This project uses the following license: [GNU GPLv3](https://choosealicense.com/licenses/gpl-3.0/).











