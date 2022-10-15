{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.neofetch
    pkgs.htop
    pkgs.gnupg
    pkgs.nix-index
    pkgs.bind
    pkgs.wireguard-tools
    pkgs.xclip
    pkgs.less
    pkgs.cron
    pkgs.findutils
    pkgs.nmap
    pkgs.pwgen
    pkgs.pass
    pkgs.git-crypt
    pkgs.tcpdump
    pkgs.git
    pkgs.busybox
  ];
}
