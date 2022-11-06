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

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    nextcloud-client
    podman-compose
  ];

  nix = {
    enable = true;
    package = pkgs.nix;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  home.file.".local/bin/" = {
    source = ../../home-manager/tools;
    recursive = true;
    executable = true;
  };

  home.file.".gitconfig".source = ./config/gitconfig;

  gtk = {
    enable = true;
    gtk2 = {
      extraConfig = ''
        gtk-enable-animations = 1
        gtk-primary-button-warps-slider = 0
        gtk-toolbar-style = 3
        gtk-menu-images = 1
        gtk-button-images = 1
        gtk-cursor-theme-size = 24
        gtk-cursor-theme-name = "breeze_cursors"
        gtk-icon-theme-name = "breeze"
        gtk-font-name = "Noto Sans,  10"
      '';
    };
    gtk3 = {
      extraConfig = {
        gtk-application-prefer-dark-theme = true;
        gtk-button-images = true;
        gtk-cursor-theme-name = "breeze_cursors";
        gtk-cursor-theme-size = 24;
        gtk-decoration-layout = "icon:minimize,maximize,close";
        gtk-enable-animations = true;
        gtk-font-name = "Noto Sans,  10";
        gtk-icon-theme-name = "breeze";
        gtk-menu-images = true;
        gtk-modules = "colorreload-gtk-module";
        gtk-primary-button-warps-slider = false;
        gtk-toolbar-style = 3;
      };
    };
    gtk4 = {
      extraConfig = {
        gtk-application-prefer-dark-theme = true;
        gtk-cursor-theme-name = "breeze_cursors";
        gtk-cursor-theme-size = 24;
        gtk-decoration-layout = "icon:minimize,maximize,close";
        gtk-enable-animations = true;
        gtk-font-name = "Noto Sans,  10";
        gtk-icon-theme-name = "breeze";
        gtk-primary-button-warps-slider = false;
      };
    };
  };

  imports = [
    ../../home-manager/dev-environment.nix
    ../../home-manager/system-tools.nix
    ../../home-manager/desktop-environment.nix
  ];


}
