{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "fwrage";
  home.homeDirectory = "/home/fwrage";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Raw configuration files
  home.file.".config/nix/nix.conf".source = ./config/nix/nix.conf;

  home.packages = [
    pkgs.nix
  ];

  imports = [
    ./dev-environment.nix
    ./system-tools.nix
  ];
}

