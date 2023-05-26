#####################
## completions after compinit
#####################

if type "terraform" >/dev/null; then
	complete -o nospace -C "$(which terraform)" terraform
fi

if type "vault" >/dev/null; then
	complete -o nospace -C "$(which vault)" vault
fi
