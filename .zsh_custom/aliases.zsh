# **************************** zsh aliases *************************************

alias ll="ls -lah"
alias t="tapis"
alias bfg="java -jar ~/.local/bin/bfg-1.13.0.jar"
alias jenkins-local="docker run --rm -u root -p 8080:8080 \
-v jenkins-data:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock \
-v \$HOME:/home jenkinsci/blueocean"

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

# git track dotfiles
alias config='/usr/bin/git --git-dir=/Users/TASethanho/.cfg/ --work-tree=/Users/TASethanho'

# git track vimwiki contents
alias vw='/usr/bin/git --git-dir=/Users/TASethanho/vimwiki/.git/ --work-tree=/Users/TASethanho/vimwiki/'
