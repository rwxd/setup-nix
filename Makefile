PROJECT_NAME := "setup-nix"
.ONESHELL:

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

setup: flake-lock-update ## setup required things

flake-lock: ## lock flakes
	nix flake lock --show-trace --extra-experimental-features nix-command --extra-experimental-features

flake-lock-update: ## lock flakes & update
	nix flake lock --update-input nixpkgs --show-trace --extra-experimental-features nix-command --extra-experimental-features

# whopper: ## build home-manager home
# 	home-manager switch --extra-experimental-features nix-command --extra-experimental-features flakes --flake .#whopper

nugget: ## build nugget nixos
	sudo nixos-rebuild switch --flake .#nugget --show-trace

whopper: ## build whopper nixos
	sudo nixos-rebuild switch --flake .#whopper --show-trace

home-akq: ## build home-manager akq
	home-manager switch --extra-experimental-features nix-command --extra-experimental-features flakes --flake .#akq

pre-commit-all: ## run pre-commit on all files
	pre-commit run --all-files

pre-commit: ## run pre-commit
	pre-commit run
