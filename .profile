# Path
if [ -f /etc/profile ]; then
    PATH=""
    source /etc/profile
fi

if [ "$(echo $PATH | grep 'opt/local')" == "" ]; then
    export PATH=/usr/local/bin:/opt/local/bin:/opt/local/sbin:$PATH
fi

# Autocomplete
if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
    . /opt/local/etc/profile.d/bash_completion.sh
fi
complete -C /opt/local/bin/aws_completer-2.7 aws


# Appearance
export TERM=screen-256color

# hightlight serch in man/less
export LESS_TERMCAP_so=$'\E[30;47m'
export LESS_TERMCAP_se=$'\E[39;49m'

function _err () {
    local err="$?"
    local red='\e[00;31m'
    local cya='\e[00;36m'
    case "$err" in
        0) echo -e $cya;;
        *) echo -e $red;;
    esac
}

function _usr () {
    local red='\e[00;31m'
    local blu='\e[00;34m'
    case "$USER" in
       "root") echo -e $red;;
       *) echo -e $blu;;
    esac
}

function _tmux_refresh() {
    case "$TMUX" in
        "") echo "";;
         *) echo "tmux refresh-client -S;"
    esac
}

export PS1="\[\$(_err)\]# \[\e[00;36m\]\W \[\$(_usr)\]=>\[\e[00m\] "
export PROMPT_COMMAND="$(_tmux_refresh) $PROMPT_COMMAND"

export CLICOLOR=1

# Bash history options
export HISTCONTROL=ignoredups
export HISTSIZE=5000
export HISTFILESIZE=5000

# Aliases
alias ls="ls -G -F"
alias ll="ls -l"
alias rm="rm -i"
alias grep="grep --color=auto"
alias mysql="mysql5 -u root --default-character-set=utf8"
alias ldd="otool -L"
alias aws="aws-2.7"
