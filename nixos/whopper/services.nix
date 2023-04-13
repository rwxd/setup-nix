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

  services.syncthing = {
    enable = true;
  };
  services.teamviewer.enable = true;

  services.printing = {
	enable = true;
	drivers = [ pkgs.hplipWithPlugin ];
  };
  services.avahi.enable = true;
  services.avahi.nssmdns = true;
  services.avahi.openFirewall = true;
  services.udev.packages = [
    pkgs.android-udev-rules
  ];
  services.tailscale.enable = true;
}
