# Load creds if available
[[ -s ~/.creds ]] && source ~/.creds

export ANDROID_HOME=~/Library/Android/sdk

# Update PATH
export PATH="$PATH:$ANDROID_HOME/tools"
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/platform-tools"

# Bash completion
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# Git aliases
alias gb="git branch" # + branch name
alias gc="git checkout" # + branch name
alias gcb="git checkout -b" # + branch name

# Quickly query IPs from commandline
geoip() {
    curl ipinfo.io/$1
}
export -f geoip

parse_git_status() {
    status=`git status -s 2> /dev/null`
    if [ -n "$status" ]; then
        echo "*"
    fi
}

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}

# Customize command prompt with git branch and status
export PS1="\u \[\033[32m\]\W\[\033[33m\]\$(parse_git_branch)\$(parse_git_status)\[\033[00m\] $ "

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
