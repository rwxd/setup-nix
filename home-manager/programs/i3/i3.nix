{ config, pkgs, ... }:
{
  home.file.".config/i3/config".source = ./config;

  home.packages = with pkgs; [
    i3
  ];
}
