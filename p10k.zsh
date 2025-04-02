# ==== Powerlevel10k Configuration ====
# Source the original p10k configuration file, but only if antigen is not loading p10k
if [[ ! -d ~/.antigen/bundles/romkatv/powerlevel10k ]] && [[ -f ~/.p10k.zsh ]]; then
  source ~/.p10k.zsh
fi 