#!/bin/sh

# git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.4.3
# git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

inst () { sudo apt-get install $@; }
with_color () { echo -e "\033[$2m$1\033[0m"; }

suc ()  { with_color "\n### $1 ###" 92; }
log ()  { with_color "\n######### $1 #########\033[0m" 93; }
hint () { with_color "Hint: $1" 36; }


PACKAGES="
  tmux
  htop

  terminus-font
  ttf-roboto
  ttf-dejavu

  jdk8-openjdk
  openjdk8-doc
  openjdk8-src

  docker
  docker-compose

  the_silver_searcher

  auto_ssh
"

PACKAGES_AUR="intellij-idea-ultimate-edition-jre
              intellij-idea-ultimate-edition

	      code

              slack-desktop

              google-cloud-sdk
              ttf-google-fonts-git

	      gnome-terminal-transparency
              "
log_step(){
    echo "--------------------------------------------------------"
    echo -e $1
    echo "--------------------------------------------------------"
}

docker_running() {
    return $(systemctl -q is-active docker)
}

log_step "Installing Arch Linux packages:\n ${PACKAGES}"
sudo pacman -qS --needed --noconfirm ${PACKAGES}

log_step "Installing from AUR (Arch Linux User Repository):\n ${PACKAGES_AUR}"
pacaur -qaS --needed --noconfirm ${PACKAGES_AUR}

log_step "Installing app engine gcloud component"
sudo gcloud -q components install app-engine-java
sudo /opt/google-cloud-sdk/install.sh -q --rc-path /etc/bash.bashrc #turn on bash-completion

log_step "Done"
