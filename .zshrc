# Aliases
alias cls="clear"
alias clsf="clear && fastfetch"
alias cat="bat -p -P"
alias cd="z"
alias l="eza -l --git -a"
alias lt="eza --tree --level=2 --long --git"
alias ltree="eza --tree --level=2 --git"
alias tmas="tmux attach-session -t"
alias tmks="tmux kill-session -t"
alias tmls="tmux ls"
alias v="nvim"
alias oz='nvim ~/.zshrc'
alias ref='source ~/.zshrc'

# Exports(before evals)
export NVM_DIR="$HOME/.nvm"
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"

# Evals
eval "$(ssh-agent -s)"
eval "$(zoxide init zsh)"
eval "$(goenv init -)"
eval "$(starship init zsh)"

# Exports(after evals)
export GOBIN="$GOPATH/bin"
export PATH="$GOBIN:$PATH"

# Zap plugin manager
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# Plugins
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"

# Node Version Manager
[ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh"
[ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm"
