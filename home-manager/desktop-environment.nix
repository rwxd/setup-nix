{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    bluez
    blueman
    pavucontrol
    dunst
    protonvpn-cli
    firefox
    brave
    bitwarden
    spotify
    spicetify-cli
    libreoffice-qt
    feh
    discord
    vlc
    obsidian
    flameshot
    element-desktop
    firejail
    tor
    todoist
    youtube-dl
    cryptomator
    qtpass
    vscode
    anki-bin
    xss-lock
  ];

  services.screen-locker = {
    enable = true;
    lockCmd = "${pkgs.i3lock}/bin/i3lock --nofork -c 000000";
    xautolock = {
      enable = true;
      detectSleep = true;
    };
  };

  imports = [
    ./programs/rofi/rofi.nix
    ./programs/picom/picom.nix
    ./programs/i3/i3.nix
    ./programs/i3status/i3status.nix
    ./programs/i3status-rust.nix
    ./programs/kitty/kitty.nix
    ./programs/alacritty/alacritty.nix
  ];
}
