# History settings
HISTFILE=~/.histfile
HISTSIZE=100
SAVEHIST=1000

if test -z "${XDG_RUNTIME_DIR}"; then
  export XDG_RUNTIME_DIR=/tmp/${UID}-runtime-dir
  if ! test -d "${XDG_RUNTIME_DIR}"; then
    mkdir "${XDG_RUNTIME_DIR}"
    chmod 0700 "${XDG_RUNTIME_DIR}"
  fi
fi

# Aliases
alias ls="exa -l"
alias l="exa -la"
alias grep="rg"
alias cat="bat"

alias s="sudo xbps-install"
alias su="sudo xbps-install -Su"
alias r="sudo xbps-remove"
alias rq="sudo xbps-remove -oO && sudo rm -r /var/cache/xbps/*"

export TZ=Europe/London
setxkbmap gb

# The Starship prompt
eval "$(starship init zsh)"