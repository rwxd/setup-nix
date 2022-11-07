{ pkgs, config, ... }:
{
  mainUser = "nixos";
  home-manager.users."fwrage" = import ../../home-manager/iso.nix;
  environment.systemPackages = with pkgs; [
  ];
}
