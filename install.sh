#!/bin/bash

stinstall () {
  echo "Installing requirements for st build..."
  sleep 0.5
  sudo xbps-install -Su libharfbuzz-devel libXlib-devel fontconfig-devel make libX11-devel libXft-devel
  
  git clone https://github.com/lukesmithxyz/st
  cd st
  sudo make install
  
  echo "Removing build dependencies..."
  sleep 0.5
  sudo xbps-remove -oO libharfbuzz-devel libXlib-devel fontconfig-devel make libX11-devel libXft-devel
}

fontinstall () {
  wget https://rubjo.github.io/victor-mono/VictorMonoAll.zip
  unzip VictorMonoAll.zip
  rm -r EOT OTF WOFF WOFF2 LICENSE.txt
  sudo mv TTF/* /usr/share/fonts/TTF/ && rm -r TTF
  
  wget https://raw.githubusercontent.com/duyplus/fontawesome-pro/master/webfonts/fa-solid-900.ttf
  sudo mv fa-solid-900.ttf /usr/share/fonts/TTF/
}

install () {
  echo "Installing NOW, please type sudo password as necessary."
  sleep 1
  echo "Installing dependencies via package manager..."
  sleep 0.5
  sudo xbps-install -Su polybar rofi leftwm zsh starship ripgrep bat exa xorg helix feh pulseaudio scrot unzip wget zathura dunst
  
  echo "Starting required system services..."
  sleep 0.5
  sudo ln -s /etc/sv/pulseaudio /var/service
  sudo sv start pulseaudio
  
  echo "Changing shell to zsh..."
  sleep 0.5
  chsh -s /bin/zsh $(id -nu)
    
  if $(echo $CLONED) == '1'; then
    cd dotfiles-leftwm
  fi
  cp -r config/* config/.* ~/.config/ && cp -r xorg/.* ~/
  
  echo "Getting fonts (Victor Mono & Font Awesome v6 Pro)"
  sleep 0.5
  fontinstall
  
  echo "Compiling st (Luke's fork) [https://github.com/lukesmithxyz/st]"
  sleep 0.5
  stinstall
  
  cd
  echo "Installation completed."
  echo "A reboot is recommended, but not necessary."i
  echo "Keep in mind that:\nThis script installs only the essentials, such as a terminal emulator and a window manager.\nPlease install the rest using the terminal installed (st)"
}

if [ $(basename $(pwd)) == "dotfiles-leftwm" ]; then
  echo "Proceeding to installation."
  export CLONED=0
  sleep 1
  if [[ $(lsb_release -c) == *"void"* ]]; then
    install
  else
    echo "This script only works on Void Linux, and is designed to be used in a base installation."
  fi
else
  echo "Repository not found, cloning repository."
  sleep 1
  echo "'git' will be installed if necessary"
  export CLONED=1
  if [ -x "$(command -v git)" ]; then
    git clone https://github.com/devraza/dotfiles-leftwm
  else
    sudo xbps-install -Su git
    git clone https://github.com/devraza/dotfiles-leftwm
  fi
fi
