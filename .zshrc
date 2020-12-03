umask 002

# any key unfreezes after a ctrl-s
stty ixany

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Base of the android install
ANDROID=$HOME/android

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git vi-mode brew github python django kubectl helm)

[[ -e $ZSH/oh-my-zsh.sh ]] && source $ZSH/oh-my-zsh.sh

# Customize to your needs...
#Basic UI
setopt nobeep
setopt autocd

#Prompt Stuff
setopt PROMPT_SUBST
export PS1="%m:%~>"
#export PS1="z|%~>"
# Prompt themes!
#autoload -U promptinit
#promptinit
#autoload -U colors; colors
#export PS1="${fg[green]%}%~%{$reset_color%}>"

# RPROMPT: Show git branch info on the right 
setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats       \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'

zstyle ':vcs_info:*' enable git cvs svn

# or use pre_cmd, see man zshcontrib
vcs_info_wrapper() {
  vcs_info
  if [ -n "$vcs_info_msg_0_" ]; then
    echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
  fi
}
RPROMPT=$'$(vcs_info_wrapper)'

# Edit the comand line by hitting esc-v
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

#History

#setopt SHARE_HISTORY
setopt no_sharehistory
setopt inc_append_history
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.history

#bindkey -e  # emacs
bindkey -v  # vi defaults
bindkey \^U backward-kill-line  # ctrl-u deletes from cursor to start of line
bindkey \^W backward-kill-word  
bindkey \^A beginning-of-line
bindkey \^E end-of-line
bindkey \^R history-incremental-search-backward
bindkey \^S history-incremental-search-forward

alias lsports="lsof -i -P"
alias wgit="wget --no-check-certificate"
alias push="git push origin master"
alias pull="git pull --rebase origin master && git submodule update --init --recursive"
alias sshwwt="ssh -XC escharff@wow.arc.nasa.gov -t ssh -XC ted@198.10.124.5"
alias gittidy="git branch --merged | grep -v master | xargs git branch -d"

# Autocorrect Exceptions
alias ack="nocorrect ack"
alias git="nocorrect git"
unsetopt correct_all # just disable all of them.  this feature is kind of annoying

# stimpy
alias cowsay="cowsay -f stimpy"

#kubectl
alias k="kubectl"

# All things pathy
path+=$ANDROID
path+=$ANDROID/tools
path+=$ANDROID/platform-tools
path+=$HOME/src/ec2-api-tools-1.3-30349/bin
path+=$HOME/src/ec2-ami-tools-1.3-30349/bin
path+=/opt/local/Library/Frameworks/Python.framework/Versions/Current/bin
path+=$HOME/local/gsutil
path+=/usr/local/lib/wxPython/bin
path+=/usr/local/share/npm/bin
path+=/usr/sbin
PATH=$HOME/local/bin:/usr/local/bin:/opt/local/bin:$PATH

path=($^path(-/N)) # filter out any paths that don't exists, or aren't directories/symlinks
export PATH

export EDITOR=vim
export EC2_HOME=$HOME/src/ec2-api-tools-1.3-30349
export EC2_AMITOOL_HOME=$HOME/src/ec2-ami-tools-1.3-26357

# Java
#export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home
#export CLASSPATH=$HOME/android/lib:.

if [[ -d $ANDROID/tools ]]; then
    for jar in $ANDROID/tools/lib/*jar
        do CLASSPATH+=:$jar
    done
fi

[[ -e /Users/ted/local/src/libkml-1.2.0/build/lib/python2.7/site-packages ]] && export PYTHONPATH="/Users/ted/local/src/libkml-1.2.0/build/lib/python2.7/site-packages:$PYTHONPATH"
[[ -e /usr/local/lib/python2.7 ]] && PYTHONPATH="/usr/local/lib/python2.7/site-packages:/usr/local/lib/python:$PYTHONPATH"
[[ -e /usr/local/lib/python2.7/dist-packages ]] && PYTHONPATH="/usr/local/lib/python2.7/dist-packages:$PYTHONPATH"
export PYTHONPATH
export PYTHONSTARTUP=$HOME/.pythonrc

##
# pip zsh completion start
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] ) )
}
compctl -K _pip_completion pip
# pip zsh completion end
##

if [ -f $HOME/.local_profile ]; then
    source $HOME/.local_profile
fi

# Golang
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH

source $HOME/.txsecrets
export AWS_PROFILE=strateos
source <(kubectl completion zsh)

# aws cli completion
autoload bashcompinit && bashcompinit
complete -C '/usr/local/bin/aws_completer' aws
