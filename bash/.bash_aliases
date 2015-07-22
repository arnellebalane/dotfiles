# general aliases
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias -- -="cd -"
alias ~="cd ~"
alias ls="ls --color=auto"
alias l="ls -ap"
alias ll="ls -al"
alias la="ls -a"

# git aliases
alias gi="git init"
alias gs="git status"
alias gd="git diff"
alias gds="git diff --staged"
alias ga="git add"
alias gb="git branch"
alias gc="git commit"
alias gcm="git commit -m"
alias gca="git commit --amend"
alias gp="git push"
alias gpo="git push origin"
alias gpu="git pull origin"
alias gco="git checkout"
alias gl="git log"
alias glo="git log --oneline"
alias gf="git fetch"
alias gr="git remote -v"
alias gcl="git clone"

# django aliases
alias manage="python manage.py"
alias bmanage="./bin/manage"
alias runserver="./bin/manage runserver"

# lampp aliases
alias lampp="sudo /opt/lampp/lampp"

# other aliases
# save given url offline
alias offline="wget --mirror --convert-links --backup-converted --no-clobber --adjust-extension"
alias timelog="time-log"

# copy file contents to clipboard
clipcopy="xclip -sel clip <"

# alias to the nw (node-webkit) executable
alias nw="~/.nw/nw"
