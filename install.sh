#!/usr/bin/env bash
set -euo pipefail

BOLD="\033[1m"
GREEN="\033[32m"
BLUE="\033[34m"
RESET="\033[0m"

step() { echo -e "\n${BOLD}${BLUE}==> $1${RESET}"; }
done_() { echo -e "\n${BOLD}${GREEN}✓ $1${RESET}"; }

NO_CASKS=false
for arg in "$@"; do
  [[ $arg == "--no-casks" ]] && NO_CASKS=true
done

# Install Homebrew if not already present
if ! command -v brew &>/dev/null; then
  step "Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

step "Installing dependencies"
if $NO_CASKS; then
  grep -v '^cask' "$(dirname "$0")/Brewfile" | brew bundle --file=/dev/stdin
else
  brew bundle --file="$(dirname "$0")/Brewfile"
fi

step "Symlinking dotfiles"
cd "$(dirname "$0")" && stow .

done_ "All done. Restart your shell with: exec zsh"
