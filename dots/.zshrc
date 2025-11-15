# Use powerline
USE_POWERLINE="true"
# Has weird character width
# Example:
#    is not a diamond
HAS_WIDECHARS="false"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

# Path to dotfiles folder
export DOTFILES=$HOME/dotfiles

# Path to custom files
ZSH_CUSTOM=$DOTFILES/zsh

ENABLE_CORRECTION=true

# export EDITOR="vim"

# Add custom script folder to PATH
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
export PATH=$PATH:/opt/asdf-vm/bin

export PATH=$PATH:$ZSH_CUSTOM/scripts

. $ZSH_CUSTOM/aliases.zsh
. $ZSH_CUSTOM/functions.zsh
. $ZSH_CUSTOM/plugins/git.zsh

. $DOTFILES/config/env.zsh
. $DOTFILES/config/p10k.zsh

# asdf programming language version manager
# . $HOME/.asdf/asdf.sh
# . $HOME/.asdf/completions/asdf.bash

# Manjaro defaults
