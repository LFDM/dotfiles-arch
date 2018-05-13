# vi mode (oh-my-zsh is overwriting something here, so we stuff it in the back)
bindkey -v
bindkey ' ' magic-space
bindkey "^?" backward-delete-char # deletes past insert mode
bindkey '^R' history-incremental-search-backward # retain the emacs search
# some bad habits without vi mode...
bindkey '^[[1~' beginning-of-line #
bindkey '^[[4~' end-of-line
bindkey '^[[3~' delete-char
bindkey '^[[5~' up-line-or-history
bindkey '^[[6~' down-line-or-history
# more vim like attitude
bindkey '^X' edit-command-line
bindkey -M vicmd 'u' undo
bindkey -M vicmd '^R' redo
bindkey -M vicmd 'Y' vi-yank-eol
bindkey -M vicmd 'H' beginning-of-line
bindkey -M vicmd 'L' end-of-line

