#!/usr/local/bin/bash

# git-completion
if [ -f ${HOME}/.git-completion.bash ]; then
  source ${HOME}/.git-completion.bash
fi

# git-prompt
if [ -f ${HOME}/.git-prompt.sh ]; then
    source ${HOME}/.git-prompt.sh
    GP='$(__git_ps1 "(\[\e[0;32m\]%s\[\e[m\]) ")'
else
    GP=
fi

# iTerm shell integration
ITERM_SH_INTEGRATION=${HOME}/.itermrc/shell_integration/iterm2_shell_integration.bash
if [ -f ${ITERM_SH_INTEGRATION} ]; then
  source ${ITERM_SH_INTEGRATION}
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

# git track vimwiki contents
alias vw="git --git-dir=$HOME/vimwiki/.git/ --work-tree=$HOME/vimwiki/"

# vi forever
set -o vi

# ls colors
export CLICOLOR=1
