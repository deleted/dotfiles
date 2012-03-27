#########################################################################
#      /etc/bash.bashrc: System-wide initialisation file for bash       #
#########################################################################

# This script file is executed by bash(1) for interactive shells.
#
# [JNZ] Modified 23-Sep-2004
#
# Written by John Zaitseff and released into the public domain.

umask 022

shopt -s checkwinsize expand_aliases
set -P

# Terminal type modifications

if [ "$TERM" = teraterm ]; then
    export TERM=linux
fi

# Set the complete path, as /etc/login.defs does not seem to be consulted

if [ $(id -u) -eq 0 ]; then
    export PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/usr/bin/X11
else
    export PATH=/usr/local/bin:/bin:/usr/bin:/usr/bin/X11:/usr/games
fi

if [ -d ${HOME}/bin ]; then
    export PATH=${HOME}/bin:${PATH}
fi


#git branch appended to path  
BLUE1="\[\033[0;34m\]"
GREY1="\[\033[0;37m\]"
GREY2="\[\033[1;30m\]"
GREEN1="\[\033[0;39m\]"
RED1="\[\033[0;31m\]"
WHITE1="\[\033[1;37m\]"
END="\[\033[0m\]"

#PS1="me@$BLUE1\w$GREY2\$(parse_git_branch) > $END"
PS1="b|\w>"
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

