# Load ZSH syntax highlighting plugin
if [ -d "/usr/share/zsh/plugins/zsh-syntax-highlighting/" ] ; then
    # packaged location on Arch Linux
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif [ -d "/usr/share/zsh-syntax-highlighting/" ] ; then
    # packaged location on Fedora
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
