{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    dolphin
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
    signal-desktop
    keepassxc
    drawio
  ];

  services.screen-locker = {
    enable = true;
    lockCmd = "${pkgs.i3lock}/bin/i3lock --nofork -c 000000";
    xautolock = {
      enable = true;
      detectSleep = true;
    };
  };

  services.blueman-applet.enable = true;

  home.file.".profile".source = ./config/.profile;

  imports = [
    ./programs/rofi
    ./programs/picom
    ./programs/i3
    ./programs/i3status
    ./programs/i3status-rust.nix
    ./programs/kitty
    ./programs/alacritty
  ];
}
