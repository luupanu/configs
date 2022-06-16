if [ -f ~/.zsh_aliases ]; then
  . ~/.zsh_aliases
fi

setopt NO_CASE_GLOB
setopt AUTO_CD

export EDITOR=nano

PATH="/Applications/SuperCollider.app/Contents/MacOS/:$PATH"
