# Preferred editor for git, cron, and other tools that open an editor
export EDITOR=nvim
export VISUAL=nvim

# NVM - Node version manager, required to switch between Node.js versions
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# User-installed binaries not managed by a package manager (e.g. pipx, pip --user)
export PATH="$HOME/.local/bin:$PATH"

# Bun - JavaScript runtime and package manager
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# Fish-like inline suggestions as you type
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Syntax highlighting for commands
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Zellij aliases
alias zp="zellij --layout personal"

# Starship - cross-shell prompt
eval "$(starship init zsh)"
