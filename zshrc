export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"

ANTIGEN=~/Software/antigen/antigen.zsh
if [ ! -d "$(dirname $ANTIGEN)" ] ; then
  mkdir -p "$(dirname $ANTIGEN)"
fi
if [ ! -r "$ANTIGEN" ] ; then
  curl -L https://git.io/antigen > "$ANTIGEN"
fi

# Setup zsh plugins using antigen
source ~/Software/antigen/antigen.zsh
antigen use oh-my-zsh
antigen bundle catimg
antigen bundle command-not-found
antigen bundle common-aliases
antigen bundle gradle
antigen bundle sublime
antigen bundle vi-mode
antigen bundle djui/alias-tips
antigen theme --url=oskarkrawczyk/honukai-iterm-zsh --loc=honukai.zsh-theme
antigen bundle supercrabtree/k
antigen bundle https://github.com/bazelbuild/bazel.git scripts/zsh_completion
antigen apply

setopt PRINT_EXIT_VALUE
export EDITOR=vim
unalias rd
source ~/.sh_aliases
bindkey -M viins '^R' history-incremental-search-backward
bindkey -M vicmd '?' history-incremental-search-backward

[ -r "$HOME/.machine_env.sh" ] && source "$HOME/.machine_env.sh"

# TRAPALRM() {
#  if [ "$WIDGET" != "expand-or-complete" ]; then
#    zle reset-prompt
#  fi
#}
#TMOUT=1

export PATH="$HOME/.local/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(direnv hook zsh)"
