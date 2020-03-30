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
    xterm-color) color_prompt=yes;;
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
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

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

###############################################################################
# Color variables
TXTBLK='\[\e[0;30m\]' # Black - Regular
TXTRED='\[\e[0;31m\]' # Red
TXTGRN='\[\e[0;32m\]' # Green
TXTYLW='\[\e[0;33m\]' # Yellow
TXTBLU='\[\e[0;34m\]' # Blue
TXTPUR='\[\e[0;35m\]' # Purple
TXTCYN='\[\e[0;36m\]' # Cyan
TXTWHT='\[\e[0;37m\]' # White
BLDBLK='\[\e[1;30m\]' # Black - Bold
BLDRED='\[\e[1;31m\]' # Red
BLDGRN='\[\e[1;32m\]' # Green
BLDYLW='\[\e[1;33m\]' # Yellow
BLDBLU='\[\e[1;34m\]' # Blue
BLDPUR='\[\e[1;35m\]' # Purple
BLDCYN='\[\e[1;36m\]' # Cyan
BLDWHT='\[\e[1;37m\]' # White
UNDBLK='\[\e[4;30m\]' # Black - Underline
UNDRED='\[\e[4;31m\]' # Red
UNDGRN='\[\e[4;32m\]' # Green
UNDYLW='\[\e[4;33m\]' # Yellow
UNDBLU='\[\e[4;34m\]' # Blue
UNDPUR='\[\e[4;35m\]' # Purple
UNDCYN='\[\e[4;36m\]' # Cyan
UNDWHT='\[\e[4;37m\]' # White
BAKBLK='\[\e[40m\]'   # Black - Background
BAKRED='\[\e[41m\]'   # Red
BAKGRN='\[\e[42m\]'   # Green
BAKYLW='\[\e[43m\]'   # Yellow
BAKBLU='\[\e[44m\]'   # Blue
BAKPUR='\[\e[45m\]'   # Purple
BAKCYN='\[\e[46m\]'   # Cyan
BAKWHT='\[\e[47m\]'   # White
TXTRST='\[\e[0m\]'    # Text Reset
NOCOLOR='\[\033[0m\]'  # No color

###############################################################################
# Autoload ssh key
if [[ $(ssh-add -L 1>/dev/null 2>/dev/null; echo $?) -ne 0 ]]
  then
    echo "SSH key not loaded, loading..."
    ssh-add
fi

###############################################################################
# Prompt color
#PS1="$BLDBLU[$BLDGRN\u$NOCOLOR @ $BLDPUR\h$BLDBLU]-[\T][$NOCOLOR\w$BLDBLU]-[$BLDPUR\$$BLDBLU]$BLDGRN\$(if [[ \$? -eq 0 ]]; then echo \"$BLDGRN :-)\"; else echo \"$BLDRED:-(\"; fi)$NOCOLOR "
PS1="$BLDBLU[\$(if [[ \$? -eq 0 ]]; then echo \"$BLDGRN\u\"; else echo \"$BLDRED\u\"; fi)$NOCOLOR@$BLDPUR\h:$NOCOLOR\w$BLDBLU]-[\T][$NOCOLOR\$(git branch 2>/dev/null | grep '^*' | colrm 1 2)$BLDBLU]$NOCOLOR\n$ "

alias figino="ssh -t -A bastion.cscs.ch ssh figino"
alias powerpoint='wine "C:\Program Files\Microsoft Office\Office14\POWERPNT.EXE"'
alias excel='wine "C:\Program Files\Microsoft Office\Office14\EXCEL.EXE"'
alias word='wine "C:\Program Files\Microsoft Office\Office14\WINWORD.EXE"'
alias vpn-ethz='sudo openconnect --script /home/nbianchi/.vpnc-script https://sslvpn.ethz.ch/cscs --no-cert-check -u=nbianchi@cscs'
alias vpn-cscs='sudo openconnect --script /home/nbianchi/.vpnc-script https://sslvpn.ethz.ch/ --no-cert-check -u=nbianchi@cscs'
alias vi='vim'
alias gpgcrypt='gpg -a -r bianchi.nicola@gmail.com --encrypt'
alias gpgdecrypt='gpg --decrypt'
alias pollux-prod='ssh -l root 148.187.101.16'
alias pollux-prod-bare='ssh -l root 148.187.101.11'
alias pollux-tds='ssh -l root 148.187.102.16'
alias pollux-tds-bare='ssh -l root 148.187.102.11'
alias openstack-prod='source ~/tmp/openstack/cli/pollux.env'
alias openstack-tds='source ~/tmp/openstack/cli/pollux-tds.env'
alias gitcp='git commit -a -m "AutoCommit" && git push'
alias k='kubectl'
complete -F __start_kubectl k

# Kube utilities
if (command -v kubectl >/dev/null 2>&1)
  then
    source <(kubectl completion bash)
fi



export PATH=$PATH:$HOME/.linkerd2/bin
