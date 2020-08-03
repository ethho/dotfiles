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

# vi forever
set -o vi

# ls colors
export CLICOLOR=1
