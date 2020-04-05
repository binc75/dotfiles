## Dotfiles
Repository with my workstation config files and notes 

## Packages
Packages to install:  
git, vim,

## Cloud
Software to install:
gcloud, terraform, kubectl, git 

## bat
A cat clone with colors:  
bat: https://github.com/sharkdp/bat

## VIM setup
Install Vundle (package manager)  
https://github.com/VundleVim/Vundle.vim#quick-start  

Look at the plugins inside the **.vimrc** file.
```bash
# from inside vim type
:PluginInstall
```

### YCM (option 1)
Install YouCompleteMe  
https://github.com/ycm-core/YouCompleteMe#linux-64-bit

### coc.nvim (option 2)
Install "coc": Intellisense engine for Vim8 & Neovim, full language server protocol support as VSCode  
https://github.com/neoclide/coc.nvim  
https://github.com/neoclide/coc.nvim/wiki/Install-coc.nvim (**Using vim8's native package manager**)

Install coc extentions:
```bash
:ConInstall coc-python coc-json coc-yaml coc-markdownlint
```


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
