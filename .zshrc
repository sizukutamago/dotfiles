# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH"

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don't want to commit.
for file in ~/.{path,zsh_prompt,exports,aliases,functions,extra}; do
	[[ -r "$file" ]] && [[ -f "$file" ]] && source "$file"
done
unset file

# Case-insensitive globbing (used in pathname expansion)
setopt NO_CASE_GLOB

# Append to the history file, rather than overwriting it
setopt APPEND_HISTORY
setopt SHARE_HISTORY

# Autocorrect typos in path names when using `cd`
setopt CORRECT
setopt CORRECT_ALL

# Enable some useful options:
# * AUTO_CD: `dirname` will `cd` into that directory
# * EXTENDED_GLOB: Use extended globbing syntax
setopt AUTO_CD
setopt EXTENDED_GLOB

# History settings
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

# Initialize completion system
autoload -Uz compinit
compinit

# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Add tab completion for many commands
if type brew &>/dev/null; then
	FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
	autoload -Uz compinit
	compinit
fi

# Enable tab completion for `g` by marking it as an alias for `git`
if type git &>/dev/null; then
	compdef g=git
fi

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
if [[ -e "$HOME/.ssh/config" ]]; then
	h=()
	h=(${${${(@M)${(f)"$(cat ~/.ssh/config)"}:#Host *}#Host }:#*[*?]*})
	zstyle ':completion:*:ssh:*' hosts $h
	zstyle ':completion:*:scp:*' hosts $h
	zstyle ':completion:*:sftp:*' hosts $h
fi

# Add tab completion for `defaults read|write NSGlobalDomain`
compctl -k '(NSGlobalDomain)' defaults

# Add `killall` tab completion for common apps
zstyle ':completion:*:killall:*' command 'ps -u $USER -o comm'

# Load zsh plugins (installed via Homebrew)
if type brew &>/dev/null; then
	# zsh-autosuggestions: Fish-like autosuggestions
	[[ -f "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]] && \
		source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

	# zsh-syntax-highlighting: Fish-like syntax highlighting (must be loaded last)
	[[ -f "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]] && \
		source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

git config --global ghq.root '~/workspace'

# brew path
eval "$(/opt/homebrew/bin/brew shellenv)"

# mise path
eval "$(mise activate zsh)"
