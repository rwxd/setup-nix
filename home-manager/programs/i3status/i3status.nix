{ config, pkgs, ... }:
{
  home.file.".config/i3status/config".source = ./config;

  home.packages = with pkgs; [
    i3status
  ];
}
