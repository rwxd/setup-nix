{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    gpg-tui
  ];

  programs.gpg = {
    enable = true;
  };

  services.gpg-agent = {
    enable = true;
    enableSshSupport = false;
    maxCacheTtl = 86400;
    defaultCacheTtl = 86400;
  };
}
