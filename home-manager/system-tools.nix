{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    neofetch
    file
    htop
    gnupg
    nix-index
    bind
    wireguard-tools
	tailscale
    xclip
    less
    cron
    findutils
    nmap
    pwgen
    git-crypt
    tcpdump
    git
    unzip
    trash-cli
    manix
    age
    speedtest-cli
    tor
    viu
    sshpass
    sshfs
	inetutils
	gopass
	# to copy to clipboard with rofi and gopass
	xdotool
	rclone
	hplipWithPlugin
	lm_sensors
	bc # for tmux
	tcptraceroute
	killall
	restic
    autorestic
    pciutils
  ];

  imports = [
    ./programs/pass.nix
  ];
}
