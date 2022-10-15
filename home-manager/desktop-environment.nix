{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.flatpak
    pkgs.podman
    pkgs.bluez
    pkgs.blueman
    pkgs.pavucontrol
    pkgs.kitty
    pkgs.dunst
    pkgs.protonvpn-cli
    pkgs.firefox
    pkgs.brave
    pkgs.bitwarden
    pkgs.spotify
    pkgs.libreoffice
    pkgs.feh
    pkgs.rofi
    pkgs.nextcloud-client
    pkgs.discord
    pkgs.wally
    pkgs.vlc
    pkgs.obsidian
    pkgs.flameshot
    pkgs.element
    pkgs.firejail
    pkgs.appimagelauncher
    pkgs.tor
    pkgs.todoist
    pkgs.youtube-dl
    pkgs.cryptomator
    pkgs.qtpass
  ];
}
