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

