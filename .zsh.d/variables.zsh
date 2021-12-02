export EDITOR=nvim
export BROWSER=firefox
export PATH=$HOME/src/sh/vem:$PATH
export PATH=$HOME/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH

# why not
export MAKEFLAGS=' -j 6'

export HISTFILE=$HOME/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

export GREP_COLOR=31

export GOPATH=$HOME/src/go
export GOROOT=/usr/lib/go
export PATH=$GOROOT/bin:$PATH
export PATH=$GOPATH/bin:$PATH

export FZF_DEFAULT_COMMAND='fd --type f -L'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export NPM_PACKAGES="$HOME/.npm-packages"
export PATH=$NPM_PACKAGES/bin:$PATH
export NODE_PATH=$NPM_PACKAGES/lib/node_modules:$NODE_PATH

export XKB_DEFAULT_LAYOUT=en-us

# vim: ft=sh:
