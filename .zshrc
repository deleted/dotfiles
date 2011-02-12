#Basic UI
setopt nobeep
setopt autocd
setopt PROMPT_SUBST
export PS1="%m:%~>"

#History
setopt SHARE_HISTORY
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.history

bindkey -e

alias lsports="lsof -i -P"

path+=/Users/ted/apps/android/tools
path+=/opt/local/sbin/
path+=/Users/ted/src/ec2-api-tools-1.3-30349/bin
path+=/Users/ted/src/ec2-ami-tools-1.3-30349/bin
path+=/opt/local/Library/Frameworks/Python.framework/Versions/Current/bin
path+=$HOME/local/bin
export path
export EDITOR=vim
export EC2_HOME=$HOME/src/ec2-api-tools-1.3-30349
export EC2_AMITOOL_HOME=$HOME/src/ec2-ami-tools-1.3-26357
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home
#source $HOME/.eucalyptus/eucarc

export PYTHONSTARTUP=$HOME/.pythonrc
