export PATH="${HOMEBREW_PREFIX}/opt/openssl/bin:$PATH"

## starship
eval "$(starship init zsh)"

. /opt/homebrew/opt/asdf/libexec/asdf.sh

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  autoload -Uz compinit
  compinit
fi

## alias
alias v='nvim'
alias g='cd $(ghq root)/$(ghq list | peco)'
alias gh='hub browse $(ghq list | peco | cut -d "/" -f 2,3)'

