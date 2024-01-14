# Ethan's Dotfiles

This repository contains Ethan's `$HOME` configuration.

**Features**
* zsh with [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh) and [p10k](https://github.com/romkatv/powerlevel10k.git)
* Vim keybinds whenever possible: zsh, bash, readline, and [even Chrome](https://github.com/philc/vimium)
* Gruvbox for [nvim](https://github.com/morhetz/gruvbox) and [iTerm2](https://github.com/herrbischoff/iterm2-gruvbox)
* [dotbot](https://github.com/anishathalye/dotbot) for one-button installation
* [astronvim](https://astronvim.com/)

**Supported Platforms**
* [Regolith Linux v3](https://regolith-desktop.com/) - `regholith` branch
    * A few tweaks, but overall keeps Regolith's sane defaults.
* Mac OS 11.x - `mbp` branch
    * [yabai](https://github.com/koekeishiya/yabai) and [skhd](https://github.com/koekeishiya/skhd) for WM
	* [simple-bar](https://github.com/Jean-Tinland/simple-bar) status bar running in Übersicht
* WSL2 - `wsl` branch

![regolith3](docs/img/example2.png)

![zsh x vim x iTerm2 x gruvbox](docs/img/example1.png)

## Installation

1. Clone this repository and, recursively, all submodules:

```bash
git clone --recurse-submodules https://github.com/ethho/dotfiles
```

2. `git fetch --all` and `git checkout` the branch with the desired config.

3. Run the [dotbot](https://github.com/anishathalye/dotbot) install script:

```bash
dotfiles/install.sh
```

3. Remove files in `$HOME` that were not replaced with symlinks, and re-run the install script.
4. Some files in the root config may fail to link. This is expected; simply link or copy them manually.

