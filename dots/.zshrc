# Path to dotfiles folder
export DOTFILES=$HOME/dotfiles

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
# Path to custom files
ZSH_CUSTOM=$DOTFILES/zsh

ZSH_THEME='lfdm'

ENABLE_CORRECTION=true

export EDITOR="vim"

export TERM=xterm-256color

plugins=(gitfast colorize)

source $ZSH/oh-my-zsh.sh

# Add custom script folder to PATH
export PATH=$PATH:$ZSH_CUSTOM/scripts

# asdf programming language version manager
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
