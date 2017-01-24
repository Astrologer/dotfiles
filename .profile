if [ -f /etc/profile ]; then
    PATH=""
    source /etc/profile
fi

if [ "$(echo $PATH | grep 'opt/local')" == "" ]; then
    export PATH=/usr/local/bin:/opt/local/bin:/opt/local/sbin:$PATH
fi

if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
    . /opt/local/etc/profile.d/bash_completion.sh
fi

# Appearance 
export TERM=screen-256color
export PS1="\[\e[00;36m\][\u@\h \W]$\[\e[00m\] "
export CLICOLOR=1
#export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# Bash history options
export HISTCONTROL=ignoredups
export HISTSIZE=5000
export HISTFILESIZE=5000
#shopt -s histappend
if [ "$(echo $PROMPT_COMMAND | grep 'tmux')" == "" ]; then
#    export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
    export PROMPT_COMMAND="tmux has-session -t 0 > /dev/null 2>&1 && tmux refresh-client -S; $PROMPT_COMMAND"
fi

alias ls="ls -G -F"
alias ll="ls -l"
alias rm="rm -i"
alias grep="grep --color=auto"
alias mysql="mysql5 -u root --default-character-set=utf8"
alias ldd="otool -L"
