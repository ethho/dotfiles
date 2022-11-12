# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$PATH

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
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/nodejs/bin"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor
export EDITOR='code --wait'
export VISUAL=$EDITOR

# WSL 2 shortcuts
export WHOME="/mnt/c/Users/EthanHo"
export RIPLPROJ="/mnt/c/Users/EthanHo/Research Improving People's Lives/RIPL All Staff - Projects/"

if [ -f ~/.bash_sysinit ]; then
    . ~/.bash_sysinit
fi

# ********************************** Conda *************************************

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/eho/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/eho/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/eho/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/eho/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup

if [ -f "/home/eho/miniconda3/etc/profile.d/mamba.sh" ]; then
    . "/home/eho/miniconda3/etc/profile.d/mamba.sh"
fi
# <<< conda initialize <<<

export PATH="$HOME/.poetry/bin:$PATH"
eval "$(starship init zsh)"