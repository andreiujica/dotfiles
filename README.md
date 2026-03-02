# dotfiles

[![Last Commit](https://img.shields.io/github/last-commit/andreiujica/dotfiles?style=flat-square&color=cba6f7)](https://github.com/andreiujica/dotfiles/commits/main)
[![Platform](https://img.shields.io/badge/platform-macOS-informational?style=flat-square&color=89b4fa)](https://www.apple.com/macos/)
[![Managed with Stow](https://img.shields.io/badge/managed%20with-stow-a6e3a1?style=flat-square)](https://www.gnu.org/software/stow/)

Personal macOS configuration managed with [GNU Stow](https://www.gnu.org/software/stow/).

## What's included

| Config | Tool |
|--------|------|
| `.zshrc` | Zsh — shell with autosuggestions, syntax highlighting, and Starship prompt |
| `.gitconfig` | Git — sane defaults (histogram diff, zdiff3 merges, auto remote push) |
| `.config/nvim/` | Neovim — [LazyVim](https://lazyvim.org) distribution, Catppuccin Mocha theme |
| `.config/zellij/` | Zellij — terminal multiplexer with a personal layout |
| `.config/ghostty/` | Ghostty — terminal emulator, JetBrains Mono, Catppuccin Mocha |
| `.config/bat/` | bat — `cat` replacement with syntax highlighting |
| `.config/btop/` | btop — system resource monitor, Catppuccin Mocha theme |

## Prerequisites

- macOS (Apple Silicon)
- [Homebrew](https://brew.sh)

## Installation

**1. Clone the repo into your home directory.**

```sh
git clone https://github.com/andreiujica/dotfiles.git ~/dotfiles
```

**2. Install all dependencies from the Brewfile.**

```sh
brew bundle --file=~/dotfiles/Brewfile
```

This installs Ghostty, Arc, Docker Desktop, Neovim, Zellij, Starship, lazygit, fzf, ripgrep, bat, btop, fd, uv, stylua, zsh plugins, and stow itself.

**3. Symlink everything with stow.**

```sh
cd ~/dotfiles && stow .
```

Stow will create symlinks in `~` for every file and directory in `~/dotfiles`, preserving the directory structure. For example, `~/dotfiles/.config/nvim` becomes `~/.config/nvim` via symlink — no copying, just pointers.

> [!WARNING]
> If any of the target files already exist (e.g. a pre-existing `~/.zshrc`), stow will refuse to overwrite them. Back up or remove any conflicting files first.

**4. Restart your shell.**

```sh
exec zsh
```

## How stow works

Stow treats `~/dotfiles` as a "package" whose contents should be mirrored into the target directory (`~`). The command above is equivalent to manually running:

```
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.config/nvim ~/.config/nvim
# ...and so on for every file
```

To remove the symlinks later:

```sh
cd ~ && stow -D -t ~ dotfiles
```
