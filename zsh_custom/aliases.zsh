# **************************** zsh aliases *************************************

alias vim="nvim"
alias ll="ls -lah"
alias t="tapis"
alias bfg="java -jar ~/.local/bin/bfg-1.13.0.jar"

# custom workflows in ~/.local/bin
alias abe="abaco-track-executions.sh"
alias jt="jobs-track.sh"

# uninstall and reinstall openssl
# fixes "ssl module in Python is not available" error on pip install
alias reinstall-openssl="""
    brew uninstall --ignore-dependencies openssl && \
    rm -rf /usr/local/etc/openssl* && \
    brew update && brew upgrade && \
    brew install https://github.com/tebelorg/Tump/releases/download/v1.0.0/openssl.rb
    """

# git track vimwiki contents
alias vw='/usr/bin/git --git-dir=/Users/TASethanho/vimwiki/.git/ --work-tree=/Users/TASethanho/vimwiki/'
