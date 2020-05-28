#!/bin/bash

sudo apt install -y vim
sudo apt install -y git
sudo apt install -y zsh
sudo apt install -y xsel
sudo apt install -y build-essentials # Need for vimproc


# uml-utilities are needed for linux



# ZSH
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Spacevim
curl -sLf https://spacevim.org/install.sh | bash

mkdir -p ~/.local/share/fonts
pushd ~/.local/share/fonts && \
  curl -fLo "Hack NerdFonts Complete Mono.ttf" "https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete%20Mono.ttf?raw=true"


echo -n "Reloading font cache..."
fc-cache -r
echo DONE
 

#install kinto: https://github.com/rbreaves/kinto

