SAVEHIST=1000
HISTFILESIZE=1000
HISTFILE=~/.zsh/history

# Variables (primarily for ranger)
export EDITOR="emacsclient -c"

# HiDPI Scaling (currently broken)
export GDK_SCALE=2
export GDK_DPI_SCALE=0.5

# Add emacs binaries to path
export PATH=~/.emacs.d/bin:$PATH

# Timezone configuration
export TZ=Europe/London

# Fix GPG
export GPG_TTY=$(tty)

# Regular aliases
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

# Local Plugins
zi light 'xbps'
zi light 'xdg-runtime-dir'
zi light 'starship'

# Oh My Zsh! Plugins
zi snippet OMZP::git
zi snippet OMZP::sudo
zi snippet OMZP::golang
zi snippet OMZP::gh
zi snippet OMZP::git

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  startx
fi
