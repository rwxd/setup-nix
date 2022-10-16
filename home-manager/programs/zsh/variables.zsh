####################
## variables
#####################

export PATH=$PATH:/usr/local/bin/
export PATH=$PATH:$HOME/.local/bin/
export PATH=$PATH:$HOME/bin/
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/.npm-global/bin
export PATH=$PATH:$HOME/.npm-global/node_modules/.bin

export NODE_PATH=$PATH:$HOME/.npm-global/
export GPG_TTY=$(tty)
export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH}
export EDITOR=nvim
export LOCALE_ARCHIVE=/usr/lib/locale/locale-archive

export DEFAULT_USER=$USER
export TERM="xterm-256color"

export ZSH_THEME="powerlevel10k/powerlevel10k"
