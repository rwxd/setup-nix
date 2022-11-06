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

### Installation

```bash
sudo -i

# All as root
HOST=...  # set host variable to use proper configuration

nix-shell git
git clone https://this.repo.url/ /etc/nixos
cd /etc/nixos
nixos-install --root /mnt --impure --flake .#$HOST

# Reboot
```

### Update

```bash
sudo nixos-rebuild switch --flake .
```

## Home Manager

### Installation

- [ ] [Install nix](https://nixos.org/download.html)

```bash
# Activate nix profile (and add it to the .profile)
. ~/.nix-profile/etc/profile.d/nix.sh
echo ". $HOME/.nix-profile/etc/profile.d/nix.sh" >> ~/.profile
echo ". $HOME/.nix-profile/etc/profile.d/nix.sh" >> ~/.zprofile

# Open tempoary shell with nix and home-manager
nix-shell
export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH}

# Remove nix (this is necessary, so home-manager can install nix)
nix-env -e nix

# Install the configuration
home-manager switch --extra-experimental-features nix-command --extra-experimental-features flakes --flake .#configname

# Exit temporary shell
exit
```

### Update

```bash
home-manager switch --flake .
```

## Resources

- [NixOS manual](https://nixos.org/manual/nix/stable/)
- https://github.com/Misterio77/nix-starter-configs
- https://gitlab.com/LongerHV/nixos-configuration/-/tree/master/

---

<img src="./docs/ansible-nein-danke.svg" alt="drawing" width="300"/>

