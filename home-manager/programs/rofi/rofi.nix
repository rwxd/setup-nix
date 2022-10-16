{ config, pkgs, ... }:
{
  home.file.".config/rofi/nord.rasi".source = ./nord.rasi;

  home.packages = with pkgs; [
    rofi
  ];
}
