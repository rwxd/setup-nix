{ config, pkgs, ... }:
{
  home.file.".gnupg/gpg-agent.conf".source = ./gpg-agent.conf;

  programs.gpg = {
    enable = true;
  };
}
