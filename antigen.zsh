# ==== Antigen for Plugin Management ====

# Ensure necessary directories exist and clean install if needed
if [[ "$1" == "clean" ]]; then
  rm -rf ~/.antigen
  echo "Antigen directory removed for clean install."
fi

[[ -d ~/.antigen/bundles/robbyrussell/oh-my-zsh/cache/completions ]] || mkdir -p ~/.antigen/bundles/robbyrussell/oh-my-zsh/cache/completions

# Load antigen
source /opt/homebrew/share/antigen/antigen.zsh

# Set a unique cache directory to force clean install (optional)
# Uncomment and change timestamp for a forced clean install
#export ANTIGEN_CACHE=~/.antigen/init-$(date +%Y%m%d%H%M).zsh

# Set Antigen options if needed
# zstyle ':antigen:bundle' use-friendly-names 'yes'

# Use oh-my-zsh as a library
antigen use oh-my-zsh

# Load oh-my-zsh plugins
antigen bundle git
antigen bundle brew
antigen bundle macos
antigen bundle docker

# Load external plugins - be sure to load these AFTER oh-my-zsh
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

# Theme/Prompt
antigen bundle romkatv/powerlevel10k

# Apply antigen configuration
antigen apply 