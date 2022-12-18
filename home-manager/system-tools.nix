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
	taskwarrior
  ];

  imports = [
    ./programs/pass.nix
  ];
}
