# ************************** $PATH changes ************************************

# Add sd2e-cloud-cli to PATH
export PATH="/Users/TASethanho/.local/bin/sd2e-cloud-cli/bin:$PATH"
export PATH="$PATH:/Users/TASethanho/.local/bin"
export PATH="$PATH:/Users/TASethanho/.local/bin/abaco-cli/"

# OpenSSL v1.1
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
#export LDFLAGS="-L/usr/local/opt/openssl/lib"
#export CPPFLAGS="-I/usr/local/opt/openssl/include"
#export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"

# Poetry
export PATH="$HOME/.poetry/bin:$PATH"

# iTerm2 shell completion
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# ********************************** Misc. *************************************

# Source bashrc
if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi

# Initialize pyenv
eval "$(pyenv init -)"

# Commonly used IP
export ZOOM_DNS=162.255.36.11
export GOOG_DNS=8.8.8.8


# ********************************** Conda *************************************

# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/TASethanho/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/TASethanho/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/TASethanho/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/TASethanho/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

