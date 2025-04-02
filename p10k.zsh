# ==== Powerlevel10k Configuration ====

# Set instant prompt to quiet mode to prevent warnings
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# Source Powerlevel10k theme if installed with Antigen
if [[ -d ~/.antigen/bundles/romkatv/powerlevel10k ]]; then
  # Source the theme file to ensure the p10k command is available
  [[ -f ~/.antigen/bundles/romkatv/powerlevel10k/powerlevel10k.zsh-theme ]] && \
    source ~/.antigen/bundles/romkatv/powerlevel10k/powerlevel10k.zsh-theme
  
  # Source the p10k configuration if it exists
  [[ -f ~/.shellx/configs/p10k.zsh ]] && source ~/.shellx/configs/p10k.zsh || {
    if [[ -f ~/.p10k.zsh ]]; then
      source ~/.p10k.zsh
      echo "Found p10k config in home directory. Consider moving it to ~/.shellx/configs/p10k.zsh"
    else
      echo "Powerlevel10k configuration file not found. Run 'p10k configure' to create one."
    fi
  }
# Fallback if not using Antigen
elif [[ -f ~/.shellx/configs/p10k.zsh ]]; then
  source ~/.shellx/configs/p10k.zsh
elif [[ -f ~/.p10k.zsh ]]; then
  source ~/.p10k.zsh
  echo "Found p10k config in home directory. Consider moving it to ~/.shellx/configs/p10k.zsh"
fi

# Add alias for convenience
alias p10k-configure="p10k configure" 