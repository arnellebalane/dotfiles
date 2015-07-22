# Custom Go installation directory
# source: http://golang.org/doc/install
export GOROOT="$HOME/.go"
export PATH="$PATH:$GOROOT/bin"

# Add path to hub executable to PATH environment variable
export PATH="$PATH:$HOME/Documents/github/hub"

# Load RVM into a shell session *as a function*
# Installing rvm: https://www.digitalocean.com/community/tutorials/how-to-install-ruby-on-rails-on-ubuntu-14-04-using-rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

