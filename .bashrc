#!/usr/local/bin/bash

# vi style bindings
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
alias jhub="docker run -v ${PWD}:/cwd -p 8000:8000 -d --name jupyterhub jupyterhub/jupyterhub jupyterhub"

# custom workflows in ~/.local/bin
alias abe="abaco-track-executions.sh"
alias jt="jobs-track.sh"
alias abu="abaco-update-plus.sh"

# Tapis CLI
alias sl="systems-list"
alias appd="apps-deploy"
alias fl="tapis files list"
alias jl="tapis jobs list"

# git track dotfiles
alias config='/usr/bin/git --git-dir=/Users/TASethanho/.cfg/ --work-tree=/Users/TASethanho'

# sd2e-cloud-cli autocompletion
source "$(dirname $(dirname $(which tenants-init)))/completion/agave-cli"