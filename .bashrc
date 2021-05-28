[[ $- != *i* ]] && return

# keep unlimited history

export HISTFILESIZE=-1
export HISTSIZE=-1
export HISTTIMEFORMAT="[%F %T] "
export HISTFILE=~/.bash_eternal_history
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# PATH

export PATH="$HOME/.local/bin:$HOME/.rbenv/bin:$PATH"
export EDITOR=vim

# powerline-shell

function _update_ps1() {
    PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

# aliases

alias ls='ls --color=auto'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias mv='mv -v'
alias rm='rm -i -v'
alias cp='cp -v'
alias la='ls -lah'
alias ll='ls -lh'
alias ldirs='ls -ldh .*/ */'

# functions

webproxy() {
        ssh $1 -C2qTnN -D 8080
}

fixyubikey() {
	gpg-connect-agent reloadagent /bye
        gpg-connect-agent updatestartuptty /bye
}

switchyubikey() {
	gpg-connect-agent "scd serialno" "learn --force" /bye
}

sendterm() {
	infocmp | ssh $1 tic -x -o \~/.terminfo /dev/stdin
}

gpgencrypt() {
        output=${PWD}/"${1}".$(date +%s).enc
        gpg --encrypt --armor --output ${output} -r 0x0001 "${1}" && echo "${1} -> ${output}"
}

gpgdecrypt() {
	output=${1}.dec
        gpg --decrypt --output ${output} "${1}" && echo "${1} -> ${output}"
}

# other

eval "$(rbenv init -)"
