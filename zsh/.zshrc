# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

[[ ! -f /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme ]] || source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


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

# bun completions
[ -s "/Users/opo/.bun/_bun" ] && source "/Users/opo/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

[ -f "$HOME/.config/zsh/.zsh_local" ] && source "$HOME/.config/zsh/.zsh_local"
[ -f "$HOME/.config/zsh/.zsh_aliases" ] && source "$HOME/.config/zsh/.zsh_aliases"
[ -f "$HOME/.config/zsh/.zsh_work" ] && source "$HOME/.config/zsh/.zsh_work"
