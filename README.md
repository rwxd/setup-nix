# dotfiles-nixos

## Setup

Install nix & home-manager

### Nix

```bash
sudo pacman -S nix
sudo systemctl start nix-daemon.service
sudo systemctl enable nix-daemon.service

nix-channel --add https://nixos.org/channels/nixpkgs-unstable
sudo -i nix-channel --add https://nixos.org/channels/nixpkgs-unstable nixpkgs
nix-channel --update
```

### home-manager

[Standalone installation](https://nix-community.github.io/home-manager/index.html#sec-install-standalone)

```bash
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
```

```bash
ln -s ~/setup-nix/home-manager ~/.config/nixpkgs
ln -s ~/setup-nix/home-manager/hosts/home/home.nix ~/.config/nixpkgs/home.nix
```

## Home Manager

```bash
home-manager switch
```

---

<img src="./docs/ansible-nein-danke.svg" alt="drawing" width="300"/>
