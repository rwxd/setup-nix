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
    pass
    git-crypt
    tcpdump
    git
  ];
}
