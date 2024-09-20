{ pkgs, ... }: {
  services.blueman.enable = true;

  security.pam.services.kdewallet.enableKwallet = true;

  # Allow swaylock to unlock the computer for us
  security.pam.services.swaylock = { text = "auth include login"; };

  security.polkit.enable = true;

  # flatpak
  services.flatpak.enable = true;

  # xdg-desktop-portal works by exposing a series of D-Bus interfaces
  # known as portals under a well-known name
  # (org.freedesktop.portal.Desktop) and object path
  # (/org/freedesktop/portal/desktop).
  # The portal interfaces include APIs for file access, opening URIs,
  # printing and others.
  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    # gtk portal needed to make gtk apps happy
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

    config = { common.default = "*"; };
  };

  services.logind = {
    extraConfig = ''
      HandlePowerKey=suspend
      HandleLidSwitch=suspend
    '';
  };

  services.tailscale.enable = true;
  services.mullvad-vpn.enable = true;
  services.syncthing.enable = true;

  # kanshi systemd service
  systemd.user.services.kanshi = {
    description = "kanshi daemon";
    serviceConfig = {
      Type = "simple";
      ExecStart = "${pkgs.kanshi}/bin/kanshi -c kanshi_config_file";
    };
  };

  services.geoclue2.enable = true;
  services.automatic-timezoned.enable = true;

  # notebook power management
  powerManagement.powertop.enable = true;
  services.power-profiles-daemon.enable = false; # needed for tlp.enable = true
  services.tlp = {
    enable = true;
    settings = {
      # Platform
      PLATFORM_PROFILE_ON_BAT = "low-power";
      PLATFORM_PROFILE_ON_AC = "perfomance";

      # Processor
      CPU_BOOST_ON_BAT = 0;
      CPU_BOOST_ON_AC = 1;
      CPU_HWP_DYN_BOOST_ON_BAT = 0;
      CPU_HWP_DYN_BOOST_ON_AC = 1;

      CPU_SCALING_GOVERNOR_ON_AC = "powersave";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
    };
  };
}
