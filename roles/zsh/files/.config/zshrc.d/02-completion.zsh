# correction
setopt CORRECT
setopt CORRECT_ALL
setopt ALWAYS_TO_END
setopt FLOW_CONTROL
setopt PROMPT_SUBST

# completion

zstyle ':completion:*' menu select

autoload -Uz compinit && compinit
