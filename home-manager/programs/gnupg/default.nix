{ config, pkgs, ... }:
{
  home.file.".gnupg/gpg-agent.conf".source = ./gpg-agent.conf;

  home.packages = with pkgs; [
    gpg-tui
  ];

  programs.gpg = {
    enable = true;
  };
}
