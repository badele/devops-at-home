# devops-at-home

```
██████╗ ███████╗██╗   ██╗ ██████╗ ██████╗ ███████╗       █████╗ ████████╗   ██╗  ██╗ ██████╗ ███╗   ███╗███████╗
██╔══██╗██╔════╝██║   ██║██╔═══██╗██╔══██╗██╔════╝      ██╔══██╗╚══██╔══╝   ██║  ██║██╔═══██╗████╗ ████║██╔════╝
██║  ██║█████╗  ██║   ██║██║   ██║██████╔╝███████╗█████╗███████║   ██║█████╗███████║██║   ██║██╔████╔██║█████╗
██║  ██║██╔══╝  ╚██╗ ██╔╝██║   ██║██╔═══╝ ╚════██║╚════╝██╔══██║   ██║╚════╝██╔══██║██║   ██║██║╚██╔╝██║██╔══╝
██████╔╝███████╗ ╚████╔╝ ╚██████╔╝██║     ███████║      ██║  ██║   ██║      ██║  ██║╚██████╔╝██║ ╚═╝ ██║███████╗
╚═════╝ ╚══════╝  ╚═══╝   ╚═════╝ ╚═╝     ╚══════╝      ╚═╝  ╚═╝   ╚═╝      ╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝

                                                  k3s home managed cluster

```

<br/>
<br/>

## Git repo initialisation
```
sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d -b .bin
task deps:all repo:init
```

## Flash Hypriot on Raspberry PI >3
```
task tool:flash NAME=k3s-master IPADDR=${K3S1}
task tool:flash NAME=k3s-node1  IPADDR=${K3S2}
task tool:flash NAME=k3s-node2  IPADDR=${K3S3}
```

## Install commons OS and K3S
```
# update hosts.yml & group_vars (on ansible/inventory/athome )
task ansible:deps ansible:play BOOK=os
task ansible:deps ansible:play BOOK=k3s ARGS="--check"
```

### Tools
 - **git-crypts** Push encrypted your secrets
 - **direnv** Load environments variables from project foldere
 - **taskfile** task runner / build tool
 - **ansible** Manage and deploy all your infratructure with this one tool :)
 - **pre-commit** Made multiple tests before commit
 - **goemplate** Use go template for writing somes files
 - **flash** Flash RPI SD card with customization file

## :clap:&nbsp; Thanks

A lot of inspiration for my cluster came from the people that have shared their clusters over at [awesome-home-kubernetes](https://github.com/k8s-at-home/awesome-home-kubernetes) and especially :

-  **onedr0p** => https://github.com/onedr0p/home-operations

## Annex

### Available task commands
This list commands generated with `task ci:doc-task`
```
task: Available tasks for this project:
* ansible:deps: 	Install Ansible Galaxy dependencies
* ansible:ping: 	Ping nodes
* ansible:play: 	Execute ansible playbook: Usage: [INVENTORY] [ARGS] <BOOK>
* ci:doc-task: 		Include task command list into README.md
* deps:all: 		Install all desktop dependencies
* deps:archlinux: 	Install Archlinux desktop dependences
* deps:direnv: 		Install direnv binary
* deps:flash: 		Install hypriot flash binary
* deps:gomplate: 	Install gomplate binary
* deps:kubectl: 	Install kubectl client
* deps:pre-commit: 	Install a precommit pip package
* repo:init: 		Init secrets repo
* repo:show-secret: 	Show base64 git-crypt secret
* tool:flash: 		Flash RPI image into SD card
```
