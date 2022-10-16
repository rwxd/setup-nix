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
    nextcloud-client
    discord
    vlc
    obsidian
    flameshot
    element
    firejail
    tor
    todoist
    youtube-dl
    cryptomator
    qtpass
    vscode
  ];


  imports = [
    ./programs/rofi/rofi.nix
    ./programs/picom/picom.nix
    ./programs/i3/i3.nix
    ./programs/i3status/i3status.nix
    ./programs/kitty/kitty.nix
    ./programs/alacritty/alacritty.nix
  ];

}
