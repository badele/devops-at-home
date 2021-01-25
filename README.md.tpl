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
# before execute this script update your hosts.yml
# and group_vars (on ansible/inventory/athome )
# See more options in ansible folder
task ansible:deploy:os # first run, reboot yes
task ansible:deploy:k3s
task cluster:deploy:flux
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

- [onedr0p](https://github.com/onedr0p/home-operations)
- [blackjid](https://github.com/blackjid/k8s-gitops)
- [zbigniewzolnierowicz](https://github.com/zbigniewzolnierowicz/k8s-home)

## Annex

### Available task commands
This list commands generated with `task ci:doc-task`
```
{{ .Env.OUTPUT_TASKS }}
```
