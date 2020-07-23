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

# git track dotfiles
alias config='/usr/bin/git --git-dir=/Users/TASethanho/.cfg/ --work-tree=/Users/TASethanho'

