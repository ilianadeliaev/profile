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


    # git autocomplete

    if [ -f ~/.git-completion.bash ]; then
        source ~/.git-completion.bash
    fi


    # vars

    export PATH="/usr/local/bin:${PATH}"
    export PATH=~/.local/bin:$PATH

    export HISTCONTROL=ignoredups # do not make history duplicates
    export EDITOR=vim
    export SVN_EDITOR=vim
    export TERM=rxvt
    #alias vim='TERM=rxvt vim'

    export PYTHONSTARTUP=${HOME}/.python_startup # 'on load python' script


    export LANG="en_US.UTF-8"
    export LC_COLLATE="en_US.UTF-8"
    export LC_CTYPE="en_US.UTF-8"
    export LC_MESSAGES="en_US.UTF-8"
    export LC_MONETARY="en_US.UTF-8"
    export LC_NUMERIC="en_US.UTF-8"
    export LC_TIME="en_US.UTF-8"


    # shell

    stty stop ''

    CURRENT_TIME="\[\033[0;36m\][\T]\[\033[0m\]"
    HOST_NAME="\[\033[0;36m\]\h\[\033[0m\]"
    USER_NAME="\[\033[0;32m\]\u\[\033[0m\]"
    ROOT_NAME="\[\033[1;31m\]\u\[\033[0m\]"
    CURRENT_FOLDER="\W"
    TERM_SIGN="\[\033[0;36m\]$\[\033[0m\]"
    if [[ ${EUID} -ne 0 && $(whoami) != "root" ]]; then
        #export PS1="${HOST_NAME}@${USER_NAME}:${CURRENT_FOLDER}${TERM_SIGN} "
        #export PS1="${HOST_NAME}:${CURRENT_FOLDER}${TERM_SIGN} "
        export PS1="${CURRENT_TIME} ${HOST_NAME}:${CURRENT_FOLDER}${TERM_SIGN} "
    else
        export PS1="${HOST_NAME}@${ROOT_NAME}:${CURRENT_FOLDER}${TERM_SIGN} "
    fi


    # ssh agent
    #ssh-agent /usr/local/bin/bash
    #ssh-add ~/.ssh/id_dsa
    #ssh-add -l
    #SSH Keychain
    /usr/local/bin/keychain -q --ignore-missing --nocolor ~/.ssh/id_dsa 2>/dev/null
    . ~/.keychain/$HOSTNAME-sh
    ssh-add ~/.ssh/id_dsa

    # aliases

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

    alias ..='cd ..'

    alias grep='grep --color=auto'
    export GREP_COLOR=32

    alias cp='cp -i'
    alias mv='mv -i'
    alias rm='rm -i'

    alias make='nice -n 20 make -j 8'
    alias time='/usr/bin/time -l'

    alias ed='vim'

    alias V='vim -R -'
    alias T='tail -F'
    alias P='ps axufwww'
    alias K='kill -9 %'

    alias m='less'
    export LESS_TERMCAP_mb=$'\033[31m'  # bold font
    export LESS_TERMCAP_md=$'\033[36m'
    export LESS_TERMCAP_me=$'\033[0m'
    export LESS_TERMCAP_so=$'\033[30;43m'  # selection
    export LESS_TERMCAP_se=$'\033[0m'
    export LESS_TERMCAP_us=$'\033[1;34;4m'  # links
    export LESS_TERMCAP_ue=$'\033[0m'

    _grepParams='-RHsn'
    function G() { grep $_grepParams "$2" $1 | grep -v "\.svn" | grep -v "Binary file" | grep "$2" ; }
    function grepFw() { grep $_grepParams -w "$1" $2 | grep -v "svn" | grep -v "Binary file" | grep "$2" ; }
    if [[ $platform == 'darwin' ]]; then
        alias psA="ps aux"
    else
        alias psA="ps auxf"
    fi
    function psG() { psA | grep -v "grep" | grep "$@" ; }
    function psU() { psA -U $@ | grep -v "grep" | grep $@ ; }
    alias psS="psG skynet"
    alias psS_="psU skynet"
    alias psI="psU ilyanadelyaev"

    function killProc() {
        psA | grep -v grep | grep -F "${1}"
        psA | grep -v grep | grep -F "${1}" | awk '{ print $2 }' | xargs kill -9
        psA | grep -v grep | grep -F "${1}"
    }
    function killProcS() {
        psA | grep -v grep | grep -F "${1}"
        psA | grep -v grep | grep -F "${1}" | awk '{ print $2 }' | xargs sudo kill -9
        psA | grep -v grep | grep -F "${1}"
    }

    alias tarU="tar -xzf"
    alias tarA="tar -cvzf"

    alias D='svn di . |V'
    alias S='svn st .'
    alias U='svn up .'

    alias C='pycheck ./'
    alias TS='py.test -xs --mongo-uri="mongodb://localhost/sandbox_test"'

    # functions

    alias fix_ssh_agent="source /home/ilyanadelyaev/.local/bin/fix_ssh_agent"

    #export __CD_HOME_PATH="${HOME}"  # override on srceen creation
    function go() {
        cd ${__CD_HOME_PATH}
        echo ${PWD}
    }

    function __screen() {
        __NAME=$1
        __HOME_PATH=$2
        if [ -z ${__NAME} ]; then
            __NAME="default"
        fi
        if [ -z ${__HOME_PATH} ]; then
            __HOME_PATH="${HOME}"
        fi
        echo "screen name: ${__NAME}"
        echo "go path: ${__HOME_PATH}"

        export __SCREEN_NAME=${__NAME}
        unset __NAME

        unset __CD_HOME_PATH
        export __CD_HOME_PATH="${__HOME_PATH}"
        unset __HOME_PATH

        cd

        ~/.grab_ssh_agent

        screen -xR "yandex.${__SCREEN_NAME}"
    }


    # skynet

    alias spython='/skynet/python/bin/python'
    alias sipython='/skynet/python/bin/ipython'

    function __screen_skynet() {
        __NAME=$1
        __PATH=$2
        if [ -z ${__NAME} ]; then
            __NAME='trunk'
        fi
        if [ -z ${__PATH} ]; then
            __PATH=${__NAME}
        fi
        export PYTHON="/skynet/python/bin/python"
        export PYTHONPATH="/home/ilyanadelyaev/workspace/svn/skynet/${__PATH}/startup/supervisor/skynet:${PYTHONPATH}"
        __HOME_PATH="/home/ilyanadelyaev/workspace/svn/skynet/${__PATH}"

        #if [ -n "$SSH_AUTH_SOCK" ]; then
        #    ln -sf $SSH_AUTH_SOCK ~/tmp/ssh-auth-sock-for-screen
        #    export SSH_AUTH_SOCK="$(realpath ~/tmp/ssh-auth-sock-for-screen)"
        #fi
        __screen "skynet.${__NAME}" ${__HOME_PATH}
    }

fi

