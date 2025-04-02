# ==== Direnv Hook ====
# Disable direnv logging completely by setting empty log format
export DIRENV_LOG_FORMAT=""

# Redirect stdout and stderr to suppress all messages and prevent p10k warning
eval "$(direnv hook zsh)" &>/dev/null 