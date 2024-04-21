{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    thunderbird
    dolphin
    bluez
    blueman
    pavucontrol
    dunst
    protonvpn-cli
    mullvad
    firefox
    brave
    bitwarden
    spotify
    spicetify-cli
    libreoffice-qt
    feh
    discord
	teamspeak_client
	teamspeak5_client
    vlc
    obsidian
	logseq
    flameshot
    element-desktop
    firejail
    tor
    youtube-dl
    cryptomator
    pdfarranger
    qtpass
    anki-bin
    xss-lock
    signal-desktop
    keepassxc
    zsa-udev-rules
    drawio
    ark
	todoist
	# todoist-electron
    unrar
    kcalc
	v4l-utils
	guvcview
	obs-studio
	yt-dlp
	ledger-live-desktop
	teamviewer
	gimp
	audacity
	appimage-run
	gparted
	gnucash
	openjdk
	minecraft
	restique
	calibre
	google-chrome
	tor-browser-bundle-bin
    gromit-mpx
    obs-studio
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
	./programs/vscode
    ./programs/sway
  ];
}
