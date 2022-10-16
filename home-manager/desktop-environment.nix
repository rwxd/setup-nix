{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    flatpak
    podman
    bluez
    blueman
    pavucontrol
    kitty
    dunst
    protonvpn-cli
    firefox
    brave
    bitwarden
    spotify
    libreoffice
    feh
    rofi
    nextcloud-client
    discord
    wally
    vlc
    obsidian
    flameshot
    element
    firejail
    appimagelauncher
    tor
    todoist
    youtube-dl
    cryptomator
    qtpass
    vscode
  ];
}
