{ pkgs, ... }:
{
  services.blueman.enable = true;

  security.pam.services.kdewallet.enableKwallet = true;

  # Allow swaylock to unlock the computer for us
  security.pam.services.swaylock = {
    text = "auth include login";
  };

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
  services.avahi.nssmdns4 = true;
  services.avahi.openFirewall = true;
  services.udev.packages = [
    pkgs.android-udev-rules
  ];
  services.tailscale.enable = true;
  services.mullvad-vpn.enable = true;
}
