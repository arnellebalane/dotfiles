
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Load virtualenvwrapper
source /usr/local/bin/virtualenvwrapper.sh

# Define colors
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
NO_COLOR="\[\033[0m\]"

# Append git branch name in bash prompt
function git_branch () {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
PS1="$GREEN\u@\h$NO_COLOR:\w$YELLOW\$(git_branch)$NO_COLOR\n\$ "
