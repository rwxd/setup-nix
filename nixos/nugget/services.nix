{ pkgs, ... }:
{
  services.blueman.enable = true;

  security.pam.services.kdewallet.enableKwallet = true;

  # flatpak
  services.flatpak.enable = true;
  ## desktop integration for flatpak with portal
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  services.logind = {
    extraConfig = ''
      HandlePowerKey=suspend
      HandleLidSwitch=suspend
    '';
  };

  services.tailscale.enable = true;
  services.mullvad-vpn.enable = true;
  services.syncthing.enable = true;
}
