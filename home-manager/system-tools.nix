{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    neofetch
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
  ];

  imports = [
    ./programs/pass.nix
  ];
}
