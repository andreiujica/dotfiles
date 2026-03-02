# dotfiles

[![Last Commit](https://img.shields.io/github/last-commit/andreiujica/dotfiles?style=flat-square&color=cba6f7)](https://github.com/andreiujica/dotfiles/commits/main)
[![Platform](https://img.shields.io/badge/platform-macOS-informational?style=flat-square&color=89b4fa)](https://www.apple.com/macos/)
[![License: Unlicense](https://img.shields.io/badge/license-Unlicense-f38ba8?style=flat-square)](https://unlicense.org)

Personal macOS configuration managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Prerequisites

- macOS (Apple Silicon)

## Installation

**1. Clone the repo into your home directory.**

```sh
git clone https://github.com/andreiujica/dotfiles.git ~/dotfiles
```

**2. Run the bootstrap script.**

```sh
~/dotfiles/install.sh
```

This will install Homebrew if it isn't already present, then install all
dependencies via the Brewfile (Ghostty, Arc, Docker Desktop, Neovim, Zellij,
Starship, lazygit, fzf, ripgrep, bat, btop, fd, uv, stylua, zsh plugins, stow),
then symlink every config into `~` with stow.

To skip GUI app installs (casks) and only install CLI tools:

```sh
~/dotfiles/install.sh --no-casks
```

> [!WARNING]
> If any target files already exist (e.g. a pre-existing `~/.zshrc`), stow will
> refuse to overwrite them. Back up or remove conflicts before running.

**3. Restart your shell.**

```sh
exec zsh
```

## How stow works

Stow treats `~/dotfiles` as a "package" whose contents should be mirrored into
the target directory (`~`). The command above is equivalent to manually running:

```sh
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.config/nvim ~/.config/nvim
# ...and so on for every file
```

To remove the symlinks later:

```sh
cd ~ && stow -D -t ~ dotfiles
```

## Adding a new config

Mirror the path you want the symlink to appear at. For example, to track `~/.config/starship.toml`:

```sh
cp ~/.config/starship.toml ~/dotfiles/.config/starship.toml
rm ~/.config/starship.toml
cd ~/dotfiles && stow .
```

> [!WARNING]
> The `rm` is required — stow will refuse to create a symlink if a real file
> already exists at the target path. Always delete the original before running `stow`.

Stow re-runs safely on an already-linked tree — existing symlinks are left
untouched and only new ones are created.
