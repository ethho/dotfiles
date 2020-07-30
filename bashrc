#!/usr/local/bin/bash

# vi forever
set -o vi

# ls colors
export CLICOLOR=1

# git-completion
if [ -f ~/.git-completion.bash ]; then
  source ~/.git-completion.bash
fi

# git-prompt
if [ -f ~/.git-prompt.sh ]; then
    source ~/.git-prompt.sh
    GP='$(__git_ps1 "(\[\e[0;32m\]%s\[\e[m\]) ")'
else
    GP=
fi

# fancy PS1
export PS1="\[\e[0;35m\]\W\[\e[m\] ${GP}⌁ "

# aliases
alias ll="ls -lah"
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
alias config="git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

# git track vimwiki contents
alias vw="git --git-dir=$HOME/vimwiki/.git/ --work-tree=$HOME/vimwiki/"

