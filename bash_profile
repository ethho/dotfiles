# ************************** $PATH changes ************************************

export PATH="$PATH:$HOME/bin"

# ********************************** Misc. *************************************

# iTerm2 shell completion
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# Source bashrc
if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi

