function remove_node_modules() {
  find . -type d -name node_modules -exec rm -rf {} +
}

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

export HOST="home mb2pro"

source <(fzf --zsh)

# bun completions
[ -s "/Users/opo/.bun/_bun" ] && source "/Users/opo/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

[ -f "$HOME/.config/.zsh_local" ] && source "$HOME/.config/.zsh_local"
[ -f "$HOME/.config/.zsh_aliases" ] && source "$HOME/.config/.zsh_aliases"
[ -f "$HOME/.config/.zsh_work" ] && source "$HOME/.config/.zsh_work"
