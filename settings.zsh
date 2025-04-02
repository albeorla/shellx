# ==== ZSH Settings ====
# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt SHARE_HISTORY

# Directory navigation
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT
alias d='dirs -v'
for i in {1..9}; do
  alias "$i"="cd +$i"
done

# ==== Completion System ====
autoload -Uz compinit bashcompinit
compinit
bashcompinit
zstyle ':completion:*' menu select
fpath+=~/.zfunc 