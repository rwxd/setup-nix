{ config, pkgs, ... }:
{
  home.file.".gnupg/gpg-agent.conf".source = ./gpg-agent.conf;

  home.packages = with pkgs; [
    gnupg
  ];
}
