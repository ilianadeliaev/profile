if [ -n "$PS1" ]; then

    # detect platform

    platform='unknown'
    platform_name=$(uname)
    if [[ $platform_name == 'Linux' ]]; then
        platform='linux'
    elif [[ $platform_name == 'FreeBSD' ]]; then
        platform='freebsd'
    elif [[ $platform_name == 'Darwin' ]]; then
        platform='darwin'
    fi
    echo current platform: ${platform_name}


    # local server settings

    if [ -f ~/.bash_local ]; then
        source ~/.bash_local
    fi


    # git

    if [ -f ~/.git-completion.bash ]; then
        source ~/.git-completion.bash
    fi

    alias D='git diff . |V'
    alias S='git status .'
    alias U='git pull'


    # vars

    export PATH="/usr/local/bin:${PATH}"
    export PATH=~/.local/bin:$PATH

    export HISTCONTROL=ignoredups # do not make history duplicates
    export EDITOR=vim
    export SVN_EDITOR=vim
    export TERM=rxvt
    #alias vim='TERM=rxvt vim'

    export PYTHONSTARTUP=${HOME}/.python_startup # 'on load python' script


    # encoding

    export LANG="en_US.UTF-8"
    export LC_COLLATE="en_US.UTF-8"
    export LC_CTYPE="en_US.UTF-8"
    export LC_MESSAGES="en_US.UTF-8"
    export LC_MONETARY="en_US.UTF-8"
    export LC_NUMERIC="en_US.UTF-8"
    export LC_TIME="en_US.UTF-8"


    # shell

    stty stop ''

    if [[ -z "${TMUX_PANE}" ]]; then
        PS_PREFIX=
    else
        PS_PREFIX="\[\033[0;36m\]${TMUX_PANE}\[\033[0m\] "
    fi
    #echo "${PS_PREFIX}";

    PS_CURRENT_TIME="\[\033[0;36m\][\T]\[\033[0m\]"
    PS_HOST_NAME="\[\033[0;36m\]\h\[\033[0m\]"
    PS_USER_NAME="\[\033[0;32m\]\u\[\033[0m\]"
    PS_ROOT_NAME="\[\033[1;31m\]\u\[\033[0m\]"
    PS_CURRENT_FOLDER="\W"
    PS_TERM_SIGN="\[\033[0;36m\]$\[\033[0m\]"
    if [[ ${EUID} -ne 0 && $(whoami) != "root" ]]; then
        #export PS1="${PS_HOST_NAME}@${PS_USER_NAME}:${PS_CURRENT_FOLDER}${PS_TERM_SIGN} "
        #export PS1="${PS_HOST_NAME}:${PS_CURRENT_FOLDER}${PS_TERM_SIGN} "
        export PS1="${PS_PREFIX}${PS_CURRENT_TIME} ${PS_HOST_NAME}:${PS_CURRENT_FOLDER}${PS_TERM_SIGN} "
    else
        export PS1="${PS_HOST_NAME}@${PS_ROOT_NAME}:${PS_CURRENT_FOLDER}${PS_TERM_SIGN} "
    fi


    # ssh

    #ssh-agent /usr/local/bin/bash
    #ssh-add ~/.ssh/id_dsa
    #ssh-add -l
    #SSH Keychain
    #/usr/local/bin/keychain -q --ignore-missing --nocolor ~/.ssh/id_dsa 2>/dev/null
    #. ~/.keychain/$HOSTNAME-sh
    #ssh-add ~/.ssh/id_dsa


    # less

    export LESS_TERMCAP_mb=$'\033[31m'  # bold font
    export LESS_TERMCAP_md=$'\033[36m'
    export LESS_TERMCAP_me=$'\033[0m'
    export LESS_TERMCAP_so=$'\033[30;43m'  # selection
    export LESS_TERMCAP_se=$'\033[0m'
    export LESS_TERMCAP_us=$'\033[1;34;4m'  # links
    export LESS_TERMCAP_ue=$'\033[0m'


    # grep

    alias grep='grep --color=auto'
    export GREP_COLOR=32

    _grepParams='-RHsn'
    function G() { grep $_grepParams "$2" $1 | grep -v "\.git" | grep -v "Binary file" | grep "$2" ; }


    # tar

    alias tarU="tar -xzf"
    alias tarA="tar -cvzf"


    # ls

    if [[ $platform == 'linux' ]]; then
        alias ls='ls --color=auto -F --group-directories-first -h'
        export LS_COLORS='di=1;36:fi=0:ln=33:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=1;32'
    elif [[ $platform == 'freebsd' ]]; then
        alias ls='ls -G -F -h'
        export LSCOLORS="GxdxcxdxCxegedabagacad"
    elif [[ $platform == 'darwin' ]]; then
        alias ls='ls -G -F -h'
        export LSCOLORS="GxdxcxdxCxegedabagacad"
    fi
    alias l='ls -l'
    alias ll='ls -la'


    # tools

    alias V='vim -R -'
    alias P='ps auxwww'
    alias K='kill -9 %'

    alias cp='cp -i'
    alias mv='mv -i'
    alias rm='rm -i'

    alias make='nice -n 20 make -j 8'
    alias time='/usr/bin/time -l'

    alias ed='vim'


    # tmux

    #alias fix_ssh_agent="source ~/.local/bin/_fix_ssh_agent"

    #if [[ -z "${TMUX_PANE}" ]]; then
    #    echo
    #else
    #    fix_ssh_agent
    #fi

    #export __CD_HOME_PATH="${HOME}"  # override on srceen creation
    #function go() {
    #    cd ${__CD_HOME_PATH}
    #    echo ${PWD}
    #}

    #echo "go path: ${__CD_HOME_PATH}"

    #function __tmux() {
    #    __NAME=$1
    #    __HOME_PATH=$2
    #    if [ -z ${__NAME} ]; then
    #        __NAME="default"
    #    fi
    #    if [ -z ${__HOME_PATH} ]; then
    #        __HOME_PATH="${HOME}"
    #    fi
    #    echo "tmux name: ${__NAME}"
    #    echo "go path: ${__HOME_PATH}"

    #    export __TMUX_NAME=${__NAME}
    #    unset __NAME

    #    unset __CD_HOME_PATH
    #    export __CD_HOME_PATH="${__HOME_PATH}"
    #    unset __HOME_PATH

    #    cd

    #    ~/.local/bin/grab_ssh_agent

    #    tmux -2u attach || tmux -2u new
    #}

    # GO

    #alias GT='go test $(glide nv)'
    #alias GV='go vet -v $(glide nv)'

    #function GG() { grep $_grepParams "$1" $(glide nv) | grep -v "\.git" | grep "$1" ; }


fi
