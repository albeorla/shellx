#!/bin/zsh
# This script performs a complete clean installation of Antigen and plugins

# Echo with color for better visibility
echo "\033[1;34mPerforming clean Antigen installation...\033[0m"

# Remove existing Antigen installation
rm -rf ~/.antigen ~/.antigenrc ~/.antigenrc.zwc ~/.zcompdump* 2>/dev/null
echo "\033[1;32m✓ Removed old Antigen files\033[0m"

# Set temporary environment variable to force clean install
export ANTIGEN_CACHE=~/.antigen/init-$(date +%Y%m%d%H%M%S).zsh
echo "\033[1;32m✓ Set unique cache path: $ANTIGEN_CACHE\033[0m"

# Source the shell configuration
source ~/.zshrc
echo "\033[1;32m✓ Antigen reinstallation complete\033[0m"

# Show advice
echo "\033[1;33mNote: You may want to start a new shell session to ensure all settings take effect.\033[0m" 