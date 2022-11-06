# dotfiles-nixos

## Setup

Install nix & home-manager

### Nix

```bash
sudo pacman -S nix
sudo systemctl start nix-daemon.service
sudo systemctl enable nix-daemon.service

sudo useradd -aG nix-users $USER

nix-channel --add https://nixos.org/channels/nixpkgs-unstable
nix-channel --update
```

```bash
export NIX_CONFIG="experimental-features = nix-command flakes"
```

### home-manager

[Standalone installation](https://nix-community.github.io/home-manager/index.html#sec-install-standalone)

```bash
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
```

```bash
ln -s ~/setup-nix/home-manager ~/.config/nixpkgs
```

Choose a host to map to `~/.config/nixpkgs/home.nix`

```bash
ln -s ~/setup-nix/hosts/home/home.nix ~/.config/nixpkgs/home.nix
```

## NixOS

```bash
# All as root
HOST=...  # set host variable to use proper configuration

nix-shell git
git clone https://this.repo.url/ /etc/nixos
cd /etc/nixos
nixos-install --root /mnt --impure --flake .#$HOST

# Reboot
```

## Home Manager

```bash
home-manager switch
```

---

<img src="./docs/ansible-nein-danke.svg" alt="drawing" width="300"/>
