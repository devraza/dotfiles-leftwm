#!/bin/zsh

alias s='sudo xbps-install'
alias su='sudo xbps-install -Su'
alias syu='sudo xbps-install -Syu'
alias ry='sudo xbps-remove -y'
alias r='sudo xbps-remove'
alias ra='sudo xbps-remove -oO && sudo rm -r /var/cache/xbps/*' 
alias oo='sudo xbps-remove -oO'
alias rs='xbps-query -Rs'