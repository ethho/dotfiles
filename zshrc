# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.local/nvim-linux64/bin:$PATH
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/cockroach-v23.1.12.linux-amd64/
export PATH=$PATH:$HOME/cockroach-sql-v23.1.12.linux-amd64/


# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Disable marking untracked files under VCS as dirty.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Custom source scripts
ZSH_CUSTOM="$HOME/.zsh_custom"

# Extended glob
setopt extendedglob

# Plugins
plugins=(
    git
    docker
    z
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-vi-mode
)

source $ZSH/oh-my-zsh.sh

# ************************ User configuration **********************************

# Keybinds
bindkey -v
bindkey '^ ' autosuggest-accept
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd '!' edit-command-line

# zsh-autosuggestions
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor
export EDITOR='nvim'
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export VISUAL=$EDITOR

# ********************************** Conda *************************************

export PATH="$HOME/.poetry/bin:$PATH"
. "$HOME/.cargo/env"
eval "$(starship init zsh)"


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/eho/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/eho/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/home/eho/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/home/eho/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/home/eho/miniforge3/etc/profile.d/mamba.sh" ]; then
    . "/home/eho/miniforge3/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
