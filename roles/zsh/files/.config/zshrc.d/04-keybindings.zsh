# ctrl+(shift+)tab
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
# delete key
bindkey '^[[3' prefix-2
bindkey '^[[3~' delete-char
# home/end
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line

zmodload zsh/complist
# shift+tab reverse autocomplete
bindkey -M menuselect '^[[Z' reverse-menu-complete

