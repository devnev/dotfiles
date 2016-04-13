export PATH="/home/nev/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"

# Setup zsh plugins using antigen
source ~/Software/antigen/antigen.zsh
antigen use oh-my-zsh
antigen bundle catimg
antigen bundle command-not-found
antigen bundle common-aliases
antigen bundle debian
antigen bundle gradle
antigen bundle sublime
antigen bundle vi-mode
antigen bundle djui/alias-tips
antigen theme --url=oskarkrawczyk/honukai-iterm-zsh --loc=honukai.zsh-theme
antigen bundle supercrabtree/k
antigen apply

export EDITOR=vim
unalias api
source ~/.sh_aliases
bindkey -M viins '^R' history-incremental-search-backward
bindkey -M vicmd '?' history-incremental-search-backward

TRAPALRM() {
    if [ "$WIDGET" != "expand-or-complete" ]; then
        zle reset-prompt
    fi
}
TMOUT=1
