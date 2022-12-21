#####################
## completions
#####################

if type "kubectl" >/dev/null; then
    source <(kubectl completion zsh)
fi

if type "helm" >/dev/null; then
    source <(helm completion zsh)
fi

if type "argocd" >/dev/null; then
    source <(argocd completion zsh)
fi

if type "argo" >/dev/null; then
    source <(argo completion zsh)
fi

if type "terraform" >/dev/null; then
	complete -o nospace -C /usr/bin/terraform terraform
fi

if type "containerlab" >/dev/null; then
	source <(containerlab completion zsh)
fi

if type "kaf" >/dev/null; then
	source <(kaf completion zsh)
fi

if type "kafkactl" >/dev/null; then
	source <(kafkactl completion zsh)
fi

if type "rustup" >/dev/null; then
	rustup completions zsh > ~/.zsh/rustup-completion.zsh
	# source <(rustup completions zsh)
fi

if type "gh" >/dev/null; then
	source <(gh completion -s zsh)
fi

if type "glab" >/dev/null; then
	source <(glab completion -s zsh)
fi

if [ -f "/usr/share/nvm/init-nvm.sh" ]; then
	source "/usr/share/nvm/init-nvm.sh"
fi

if type "vault" >/dev/null; then
	complete -o nospace -C /usr/bin/vault vault
fi

if type "ipams" >/dev/null; then
	source <(ipams --show-completion zsh)
fi

if type "minikube" >/dev/null; then
	source <(minikube completion zsh)
fi

# # fzf
# if [ -f "/usr/share/fzf/completion.zsh" ]; then
# 	source /usr/share/fzf/completion.zsh
# fi
#
# if [ -f "/usr/share/fzf/key-bindings.zsh" ]; then
# 	source /usr/share/fzf/key-bindings.zsh
# fi

