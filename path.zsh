# ==== Path Configuration ====
# Add paths in order of priority (first = highest priority)
path=(
  /opt/homebrew/bin
  /opt/homebrew/sbin
  $HOME/bin
  $HOME/.local/bin
  $HOME/.bun/bin
  $HOME/.codeium/windsurf/bin
  /opt/homebrew/opt/postgresql@15/bin
  $path
)
export PATH 