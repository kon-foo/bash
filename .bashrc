## Prompt Styling
PS1='\[\033[01;33m\]$(date "+%Y-%m-%d %H:%M:%S") \[\033[01;32m\]\u@\h \[\033[01;34m\]\w$(if [[ $? == 0 ]]; then echo "\[\033[01;32m\]✔"; else echo "\[\033[01;31m\]✘"; fi)\n\[\033[01;37m\]$(if [ $(id -u) -eq 0 ]; then echo "\[\033[01;31m\]#"; else echo "\[\033[01;32m\]$"; fi) \[\033[00m\]'

## SSH 
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"


alias sshto="$SCRIPT_DIR/bashscripts/sshtoserver.sh"

# Random Number Generation
## Potentially Blocking True Random
trandom() {
    if [ "$#" -eq 1 ] && [ "$1" -gt 0 ] 2>/dev/null; then
        dd if=/dev/random bs="$1" count=1 2>/dev/null | od -An -tu4
    else
        echo "Usage: trandom <number_of_bytes>"
    fi
}
## Non-Blocking fake random
urandom() {
    if [ "$#" -eq 1 ] && [ "$1" -gt 0 ] 2>/dev/null; then
        dd if=/dev/urandom bs="$1" count=1 2>/dev/null | od -An -tu4
    else
        echo "Usage: urandom <number_of_bytes>"
    fi
}

# Networking
## Get IP Address
function getip() {
    if [[ $1 == "loc" ]]; then
        if [[ $2 == "v6" ]]; then
            ip -6 addr show | grep -oP '(?<=inet6\s)[\da-f:]+'
        else
            ip -4 addr show | grep -oP '(?<=inet\s)\d+(\.\d+){3}'
        fi
    elif [[ $1 == "pub" ]]; then
        if [[ $2 == "v6" ]]; then
            curl -6 https://ipecho.net/plain; echo
        else
            curl -4 https://ipecho.net/plain; echo
        fi
    else
        echo "Please specify 'loc' or 'pub' as the first argument."
    fi
}


## Quality if Life

# some ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
