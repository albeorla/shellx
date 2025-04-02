# Zsh Configuration (`~/.shellx`)

This directory contains the modular configuration files for the Zsh environment.

## Structure Overview

*   **`~/.zshrc`**: This file is kept minimal. Its main purpose is to load the
    automatically generated sourcing block (`generated_rc_sourcing.zsh`).
*   **`~/.zprofile`**: This file is loaded only by login shells. It should contain
    `export VAR=value` statements needed for the *entire login session* (including
    GUI applications). It should **not** source `~/.zshrc`.
*   **`~/.shellx/`**: This directory holds the actual configuration logic,
    broken down into smaller, manageable `.zsh` files.

## Special Files

*   **`00_startup.zsh`**: Contains commands that *must* run at the absolute beginning
    of the Zsh interactive setup (e.g., Powerlevel10k instant prompt). Keep this
    file minimal and fast.
*   **`99_shutdown.zsh`**: Contains commands that should run at the very end of the
    Zsh setup process.
*   **`p10k_loader.zsh`**: Loader that sources the Powerlevel10k configuration file from `configs/p10k.zsh`.
*   **`configs/p10k.zsh`**: Contains the actual Powerlevel10k configuration with custom
    settings for a minimal, clean prompt.

## Management Commands

Convenience aliases are available to help maintain the shellx setup:

*   **`shellx_help`**: Display all available management commands, aliases, and functions
*   **`reset_shellx`**: Run all generators and reset `~/.zshrc` to a minimal loader
*   **`gen_rc`**: Regenerate the sourcing block (use after adding/removing/renaming files)
*   **`gen_comps`**: Regenerate completions (use after modifying aliases or functions)
*   **`antigen_clean`**: Perform a clean install of Antigen and all plugins

## Generator Scripts

Several scripts help maintain the configuration automatically:

1.  **`generate_rc_sourcing.sh`**: 
    *   **Purpose**: Scans this directory for `.zsh` files and generates the
        `generated_rc_sourcing.zsh` file, which defines the order in which
        configuration files are sourced by `~/.zshrc`.
    *   **Order**: It sources `00_startup.zsh` first, then files listed in its
        internal `preferred_order` array, then any remaining `.zsh` files
        alphabetically, and finally `99_shutdown.zsh`.
    *   **Alias**: `gen_rc`

2.  **`generate_completions.sh`**: 
    *   **Purpose**: Scans `aliases.zsh` and `functions.zsh` to automatically
        generate basic Zsh completion definitions (`compdef` lines) into the
        `generated_completions.zsh` file.
    *   **Alias**: `gen_comps`

3.  **`reset_shellx_setup.sh`**:
    *   **Purpose**: Runs all generators and resets `~/.zshrc` to a minimal loader
        that properly sources the generated configuration.
    *   **Alias**: `reset_shellx`

4.  **`clean_install_antigen.sh`**:
    *   **Purpose**: Performs a clean installation of Antigen and all plugins by
        removing the existing Antigen directory and caches.
    *   **Alias**: `antigen_clean`

## Core Configuration Files

These files contain the main parts of the shell configuration. The sourcing order
is determined by `generate_rc_sourcing.sh`.

*   `env_vars.zsh`: Basic environment variables (`EDITOR`, `LANG`, etc.).
*   `path.zsh`: Base PATH setup.
*   `nvm.zsh`: Node Version Manager setup.
*   `tools.zsh`: Setup for other development tools (Homebrew, pyenv, Bun, etc.).
*   `settings.zsh`: Core Zsh options (`setopt`), history settings, navigation aliases,
    and `compinit` (completion system initialization).
*   `functions.zsh`: Custom shell functions and the `shellx_help` function.
    Also includes `silent_activate` for Python virtual environments.
*   `aliases.zsh`: Custom shell aliases and management command aliases.
*   `antigen.zsh`: Zsh plugin manager (Antigen) setup.
*   `direnv.zsh`: Direnv hook setup with silenced output to prevent prompt issues.
*   `generated_completions.zsh`: **(Generated)** Contains `compdef` lines created by
    `generate_completions.sh`. Do not edit directly.
*   `generated_rc_sourcing.zsh`: **(Generated)** Contains the `source` commands
    executed by `.zshrc`. Do not edit directly.

## Important Notes

* The module loading order is important! `direnv.zsh` is loaded before `antigen.zsh` (which loads Powerlevel10k) 
  to prevent prompt warnings.
* Powerlevel10k is configured for a minimal, clean prompt with transient prompt enabled.
* Use the `venv` alias to activate Python virtual environments without triggering warnings.

## Additional Documentation

*   `ANTIDOTE-MIGRATION.md`: Guide for migrating from Antigen to Antidote, a faster
    and more modern Zsh plugin manager.

## Maintenance

1.  Add/edit specific configurations in the relevant `.zsh` file.
2.  If you added/removed/renamed a `.zsh` file, run `gen_rc`.
3.  If you changed aliases or functions, run `gen_comps`.
4.  To see all available commands, run `shellx_help`.
5.  For a clean Antigen plugin install, run `antigen_clean`.

**(Note:** The generator scripts use Zsh-specific features. Linters like
ShellCheck might show warnings because they don't fully support Zsh, but the
scripts should function correctly.)