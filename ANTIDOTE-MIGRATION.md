# Migrating from Antigen to Antidote

[Antidote](https://getantidote.github.io/) is the successor to Antigen, offering better performance and a more modern approach to Zsh plugin management.

## Migration Steps

1. **Install Antidote**:
   ```zsh
   brew install antidote
   ```

2. **Create a plugins file**:
   ```zsh
   # Create ~/.zsh_plugins.txt with your current plugins
   cat > ~/.zsh_plugins.txt << 'EOL'
   # Oh-My-Zsh plugins
   ohmyzsh/ohmyzsh path:lib
   ohmyzsh/ohmyzsh path:plugins/git
   ohmyzsh/ohmyzsh path:plugins/brew
   ohmyzsh/ohmyzsh path:plugins/macos
   ohmyzsh/ohmyzsh path:plugins/docker
   ohmyzsh/ohmyzsh path:plugins/dotenv

   # Other plugins
   zsh-users/zsh-syntax-highlighting
   zsh-users/zsh-autosuggestions
   
   # Prompt/theme
   romkatv/powerlevel10k kind:fpath
   EOL
   ```

3. **Create a new `~/.shellx/antidote.zsh` file**:
   ```zsh
   # ==== Antidote for Plugin Management ====
   
   # Source antidote
   source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh
   
   # Initialize plugins statically with ~/.zsh_plugins.txt
   antidote load
   ```

4. **Update your plugin list**:
   If you need to regenerate the static plugin file manually:
   ```zsh
   antidote bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.zsh
   ```

5. **Clean up Antigen (after successful Antidote setup)**:
   ```zsh
   rm -rf ~/.antigen
   ```

## Performance Tweaks

For maximum performance, you can use this more elaborate setup:

```zsh
# Set the root name of the plugins files (.txt and .zsh)
zsh_plugins=${ZDOTDIR:-~}/.zsh_plugins

# Generate a new static file whenever .zsh_plugins.txt is updated
if [[ ! ${zsh_plugins}.zsh -nt ${zsh_plugins}.txt ]]; then
  antidote bundle <${zsh_plugins}.txt >|${zsh_plugins}.zsh
fi

# Source the static plugins file
source ${zsh_plugins}.zsh
```

## References
- [Antidote Documentation](https://getantidote.github.io/)
- [Antidote GitHub](https://github.com/mattmc3/antidote) 