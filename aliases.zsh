# shellcheck shell=bash
# --- Shell Aliases ---

# General
alias envc='vim ~/.env.zsh'
alias envr='source ~/.zshrc'
alias grep='grep --color=auto'
alias mkdir='mkdir -p'
alias pathx='sed "s/:/\n/g" <<< "$PATH"'
alias python='python3'
alias utime='date +%s'
alias wrapoff='tput smam'
alias wrapon='tput rmam'
alias tree='tree --gitignore'

# Directory Listing (using ls as per .zshrc)
alias l='ls -l'
alias la='ls -la'
alias ll='ls -l'

# Git
alias g='git'
alias gs='git status -u'
alias gconf='vim ~/.gitconfig'
alias gignore='git update-index --assume-unchanged'
alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign --message "--wip-- [skip ci]"'
alias grbi='git rebase --interactive'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbir='git rebase --interactive --root'

# macOS Specific
alias hidefiles='defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder'
alias showfiles='defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder'

# Tar
alias tarc='tar -czvf'
alias tarx='tar -xzvf'

# YouTube Download
alias yts='yt-dlp -f bestaudio -x --audio-format wav --audio-quality 0'

# Shellx Management
alias reset_shellx='~/.shellx/reset_shellx_setup.sh'
alias gen_comps='~/.shellx/generate_completions.sh'
alias gen_rc='~/.shellx/generate_rc_sourcing.sh'
alias antigen_clean='~/.shellx/clean_install_antigen.sh'

# Python virtual environment
alias venv='silent_activate'
