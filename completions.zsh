# --- Zsh Completions ---
compdef _git g=git
compdef _git gs='git status'
compdef _git gignore='git update-index --assume-unchanged'
compdef _git gwip='git commit --no-verify --no-gpg-sign --message "--wip-- [skip ci]"'
compdef _ls l='exa -l --git'
compdef _ls la='exa -a'
compdef _ls ll='exa -l'
compdef _ls lla='exa -la'
compdef _vim envc='vim ~/.env.zsh'
compdef _vim gconf='vim ~/.gitconfig'
compdef _source envr='source ~/.zshrc'
compdef _defaults hidefiles='defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder'
compdef _defaults showfiles='defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder'
compdef _sed pathx='sed "s/:/\n/g" <<< "$PATH"'
compdef _python python=python3
compdef _tar tarc='tar -czvf'
compdef _tar tarx='tar -xzvf'
compdef _tree tree='tree --gitignore'
compdef _date utime='date +%s'
compdef _tput wrapoff='tput smam'
compdef _tput wrapon='tput rmam'
compdef _yt-dlp yts='yt-dlp -f bestaudio -x --audio-format wav --audio-quality 0' 