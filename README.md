# dotfiles-nixos

## Setup

Install nix & home-manager

## NixOS

### Disk

- use ext4
- no swap partition
- we use a swap file, because it is easier to resize and the encryption is easier

```bash
parted /dev/nvme0n1 -- mklabel gpt
parted /dev/nvme0n1 -- mkpart primary 512MB 100%
parted /dev/nvme0n1 -- mkpart ESP fat32 1MB 512MB
parted /dev/nvme0n1 -- set 2 esp on
mkfs.ext4 -L nixos /dev/nvme0n1p1
mkfs.fat -F 32 -n boot /dev/nvme0n1p2

cryptsetup luksFormat /dev/nvme0n1p1
cryptsetup luksOpen /dev/nvme0n1p1 cryptroot
mkfs.ext4 -L nixos /dev/mapper/cryptroot

mount /dev/disk/by-label/nixos /mnt
mkdir /mnt/boot
mount /dev/nvme0n1p2 /mnt/boot/

nixos-generate-config
```

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

