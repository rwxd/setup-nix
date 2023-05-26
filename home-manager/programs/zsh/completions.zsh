#####################
## completions
#####################

export fpath=(~/.zsh/completion $fpath)

if ! [ -d "$HOME/.zsh/completion" ]; then
	mkdir "$HOME/.zsh/completion"
]

if type "kubectl" >/dev/null && ! [ -f "$HOME/.zsh/completion/_kubectl" ]; then
    kubectl completion zsh > $HOME/.zsh/completion/_kubectl
fi

if type "helm" >/dev/null && ! [ -f "$HOME/.zsh/completion/_helm" ]; then
    helm completion zsh > "$HOME/.zsh/completion/_helm"
fi

if type "argocd" >/dev/null && ! [ -f "$HOME/.zsh/completion/_argocd" ]; then
    argocd completion zsh > $HOME/.zsh/completion/_argocd
fi

if type "argo" >/dev/null && ! [ -f "$HOME/.zsh/completion/_argo" ]; then
    argo completion zsh > "$HOME/.zsh/completion/_argo"
fi

if type "containerlab" >/dev/null && ! [ -f "$HOME/.zsh/completion/_containerlab" ]; then
	containerlab completion zsh > "$HOME/.zsh/completion/_containerlab"
fi

if type "kaf" >/dev/null && ! [ -f "$HOME/.zsh/completion/_kaf" ]; then
	kaf completion zsh > "$HOME/.zsh/completion/_kaf"
fi

if type "kafkactl" >/dev/null && ! [ -f "$HOME/.zsh/completion/_kafkactl" ]; then
	kafkactl completion zsh > "$HOME/.zsh/completion/_kafkactl"
fi

if type "rustup" >/dev/null && ! [ -f "$HOME/.zsh/completion/_rustup" ]; then
	rustup completions zsh > "$HOME/.zsh/completion/_rustup"
fi

if type "gh" >/dev/null && ! [ -f "$HOME/.zsh/completion/_gh" ]; then
	gh completion -s zsh > "$HOME/.zsh/completion/_gh"
fi

if type "glab" >/dev/null && ! [ -f "$HOME/.zsh/completion/_glab" ]; then
	glab completion -s zsh > "$HOME/.zsh/completion/_glab"
fi

if [ -f "/usr/share/nvm/init-nvm.sh" ] && ! [ -f "$HOME/.zsh/completion/_init-nvm" ]; then
	cp /usr/share/nvm/init-nvm.sh "$HOME/.zsh/completion/_init-nvm"
fi

if type "ipams" >/dev/null && ! [ -f "$HOME/.zsh/completion/_ipams" ]; then
	ipams --show-completion zsh > "$HOME/.zsh/completion/_ipams"
fi

if type "ansible-workspace" >/dev/null && ! [ -f "$HOME/.zsh/completion/_ansible-workspace" ]; then
	ansible-workspace --show-completion zsh > "$HOME/.zsh/completion/_ansible-workspace"
fi

if type "minikube" >/dev/null && ! [ -f "$HOME/.zsh/completion/_minikube" ]; then
	minikube completion zsh > "$HOME/.zsh/completion/_minikube"
fi

# # fzf
# if [ -f "/usr/share/fzf/completion.zsh" ]; then
# 	source /usr/share/fzf/completion.zsh
# fi
#
# if [ -f "/usr/share/fzf/key-bindings.zsh" ]; then
# 	source /usr/share/fzf/key-bindings.zsh
# fi
