PROJECT_NAME := "setup-nix"
.ONESHELL:

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

setup: flake-lock-update ## setup required things

flake-lock: ## lock flakes
	nix flake lock --show-trace --extra-experimental-features nix-command --extra-experimental-features

flake-lock-update: ## lock flakes & update
	nix flake lock \
		--update-input nixpkgs \
		--update-input nixpkgs-unstable \
		--update-input home-manager \
		--update-input home-manager-unstable \
		--show-trace \
		--extra-experimental-features nix-command \
		--extra-experimental-features flakes

iso: ## make iso image
	nix build .#nixosConfigurations.isoimage.config.system.build.isoImage

# whopper: ## build home-manager home
# 	home-manager switch --extra-experimental-features nix-command --extra-experimental-features flakes --flake .#whopper

services:
	nixos-rebuild switch --flake .#services --use-remote-sudo --target-host services.fritz.box --build-host services.fritz.box

nugget: ## build nugget nixos
	sudo nixos-rebuild switch --flake .#nugget

whopper: ## build whopper nixos
	sudo nixos-rebuild switch --flake .#whopper

home-akq: ## build home-manager akq
	home-manager switch --extra-experimental-features nix-command --extra-experimental-features flakes --flake .#akq

pre-commit-all: ## run pre-commit on all files
	pre-commit run --all-files

pre-commit: ## run pre-commit
	pre-commit run
