SAVEHIST=1000
HISTFILESIZE=1000
HISTFILE=~/.zsh/history

# Variables
export RUST_SRC_PATH=~/.rustup/toolchains/nightly-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src
export EDITOR="neovide"

# HiDPI Scaling
export QT_AUTO_SCREEN_SCALE_FACTOR=1 qutebrowser
export GDK_SCALE=2
export GDK_DPI_SCALE=0.5

# Add emacs binaries to path
export PATH=~/.local/bin:~/.cargo/bin:~/go/bin:$PATH

# Timezone configuration
export TZ=Europe/London

# Fix GPG
export GPG_TTY=$(tty)

# XDG_RUNTIME_DIR
if test -z $XDG_RUNTIME_DIR; then
  export XDG_RUNTIME_DIR=/tmp/${UID}-runtime-dir
    if ! test -d $XDG_RUNTIME_DIR; then
      mkdir $XDG_RUNTIME_DIR	
      chmod 0700 $XDG_RUNTIME_DIR
    fi
fi

# Starship prompt (https://starship.rs)
export STARSHIP_CONFIG=~/.zsh/starship.toml
eval $(starship init zsh)

# Regular aliases
alias token='pass git/token | xclip'
alias xclip='xclip -selection clipboard'
alias ouchd='ouch decompress'
alias ouchc='ouch compress'
alias cat='bat'
alias e='emacsclient -c -a "emacs"'
alias ls='exa --oneline --sort=size --long'
alias l='exa --oneline --sort=size --long --all'
alias .1='cd ..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias grep='rg'
alias mkdir='mkdir -p'

# XBPS
alias s='sudo xbps-install'
alias su='sudo xbps-install -Su'
alias syu='sudo xbps-install -Syu'
alias ry='sudo xbps-remove -y'
alias r='sudo xbps-remove'
alias ra='sudo xbps-remove -oO && sudo rm -r /var/cache/xbps/*' 
alias oo='sudo xbps-remove -oO'
alias rs='xbps-query -Rs'

### zinit Plugin Manager
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
source "${ZINIT_HOME}/zinit.zsh"

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Initialize
zi light 'zsh-users/zsh-completions'
zi light 'zsh-users/zsh-history-substring-search'
zi light 'zdharma-continuum/fast-syntax-highlighting'

zi load 'zsh-users/zsh-autosuggestions'

# Oh My Zsh! Plugins
zi snippet OMZP::git
zi snippet OMZP::sudo
zi snippet OMZP::golang
zi snippet OMZP::gh
zi snippet OMZP::git

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  startx
fi
