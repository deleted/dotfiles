umask 002

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
plugins=(git vi-mode brew github python django)

[[ -e $ZSH/oh-my-zsh.sh ]] && source $ZSH/oh-my-zsh.sh

# Customize to your needs...
#Basic UI
setopt nobeep
setopt autocd

#Prompt Stuff
setopt PROMPT_SUBST
#export PS1="%m:%~>"
export PS1="z|%~>"
# Prompt themes!
#autoload -U promptinit
#promptinit
#autoload -U colors; colors
#export PS1="${fg[green]%}%~%{$reset_color%}>"

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
alias pull="git pull --rebase origin master"
alias sshwwt="ssh -XC escharff@wow.arc.nasa.gov -t ssh -XC ted@198.10.124.5"

# Autocorrect Exceptions
alias ack="nocorrect ack"
alias git="nocorrect git"
unsetopt correct_all # just disable all of them.  this feature is kind of annoying

#path+=/Users/ted/apps/android/tools
path+=$ANDROID
path+=$ANDROID/tools
path+=$ANDROID/platform-tools
path+=/Users/ted/src/ec2-api-tools-1.3-30349/bin
path+=/Users/ted/src/ec2-ami-tools-1.3-30349/bin
path+=/opt/local/Library/Frameworks/Python.framework/Versions/Current/bin
path+=/Users/ted/local/gsutil
[[-e /usr/local/lib/wxPython/bin]] && path+=/usr/local/lib/wxPython/bin
export PATH=$HOME/local/bin:/usr/local/bin:/opt/local/bin:$PATH
export path
export EDITOR=vim
export EC2_HOME=$HOME/src/ec2-api-tools-1.3-30349
export EC2_AMITOOL_HOME=$HOME/src/ec2-ami-tools-1.3-26357
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home
export CLASSPATH=$HOME/android/lib:.

if [[ -d $ANDROID/tools ]]; then
    for jar in $ANDROID/tools/lib/*jar
        do CLASSPATH+=:$jar
    done
fi

#source $HOME/.eucalyptus/eucarc # was for nebula

[[ -e /Users/ted/local/src/libkml-1.2.0/build/lib/python2.7/site-packages ]] && export PYTHONPATH="/Users/ted/local/src/libkml-1.2.0/build/lib/python2.7/site-packages:$PYTHONPATH"
[[ -e /usr/local/lib/python2.7 ]] && export PYTHONPATH="/usr/local/lib/python2.7/site-packages:/usr/local/lib/python:$PYTHONPATH"
export PYTHONSTARTUP=$HOME/.pythonrc

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

