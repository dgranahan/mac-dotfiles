# Load creds if available
[[ -s ~/.creds ]] && source ~/.creds

export JAVA_HOME=`/usr/libexec/java_home`
export HADOOP_HOME=`brew --prefix hadoop`/libexec
export HADOOP_CLASSPATH=$HADOOP_CLASSPATH:$HADOOP_HOME/share/hadoop/tools/lib/*

# Update path
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-getopt/bin:$PATH"
export PATH="$PATH:$ANDROID_HOME/platform-tools"

# Bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

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
export PS1="\u \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\$(parse_git_status)\[\033[00m\] $ "
