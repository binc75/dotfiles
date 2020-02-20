## Dotfiles
Repository with my workstation config files and notes 

## Packages
Packages to install:  
git, vim, 

## VIM setup
Install Vundle (package manager)  
https://github.com/VundleVim/Vundle.vim#quick-start  

Install YouCompleteMe  
https://github.com/ycm-core/YouCompleteMe#linux-64-bit

Look at the plugins inside the **.vimrc** file.

## K8s
### MiniKube
Before install Virtualbox, then:  
https://kubernetes.io/docs/tasks/tools/install-minikube/

### stern
Stern allows you to tail multiple pods on Kubernetes and multiple containers within the pod. Each result is color coded for quicker debugging.  
https://github.com/wercker/stern

### kubens + kubectx
**kubens** helps you switch between Kubernetes namespaces smoothly  
**kubectx** helps you switch between clusters back and forth  
https://github.com/ahmetb/kubectx  
```bash
git clone git@github.com:ahmetb/kubectx.git
cd kubectx
sudo cp -rp kube* /usr/local/bin/
```

## i3 windows manager
Install **regolith** package:  
https://regolith-linux.org/download/  
https://regolith-linux.org/docs/getting-started/install/

Configuration file in ~/config/regolith/i3
