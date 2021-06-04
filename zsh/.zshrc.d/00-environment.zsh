# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    export PATH="$HOME/.local/bin:$PATH"
fi

export GOPATH="$HOME/go"

# set PATH so it includes user's golang bin if it exists
if [ -d "$HOME/go/bin" ] ; then
    export PATH="$GOPATH/bin:$PATH"
fi

export EDITOR=vim
