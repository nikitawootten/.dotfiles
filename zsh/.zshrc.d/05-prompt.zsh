# enable git
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

zstyle ':vcs_info:git:*' formats '%F{245}(%b%c%u%F{245})%f '

zstyle ':vcs_info:git:*' check-for-changes 'true'
zstyle ':vcs_info:git:*' check-for-staged-changes 'true'

zstyle ':vcs_info:git:*' unstagedstr '%F{red}+%f'
zstyle ':vcs_info:git:*' stagedstr '%F{green}+%f'

zstyle ':vcs_info:*' enable git

export PROMPT='%(?..%F{red}?%? )%f%B%F{green}%~%f%b $vcs_info_msg_0_%# '
# export RPROMPT=