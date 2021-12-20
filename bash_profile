# ************************** $PATH changes ************************************

export PATH="$PATH:$HOME/.local/bin"

# OpenSSL v1.1
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
#export LDFLAGS="-L/usr/local/opt/openssl/lib"
#export CPPFLAGS="-I/usr/local/opt/openssl/include"
#export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"

# Poetry
export PATH="$HOME/.poetry/bin:$PATH"

# ********************************** Misc. *************************************

# iTerm2 shell completion
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# Source bashrc
if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi

# Commonly used IP
export ZOOM_DNS=162.255.36.11
export GOOG_DNS=8.8.8.8

# Use ruby in home directory
source /usr/local/share/chruby/chruby.sh
chruby 2.7.1

# ********************************** Conda *************************************

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

