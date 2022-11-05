{ pkgs, ... }:
{
  # systemd.services."i3lock" = {
  #   description = "i3lock";
  #   before = [ "sleep.target" ];
  #   wantedBy = [ "sleep.target" ];
  #
  #   serviceConfig = {
  #     DynamicUser = true;
  #     ExecStart = "${pkgs.i3lock}/bin/i3lock -f";
  #     Environment = "DISPLAY=:0";
  #     Type = "forking";
  #   };
  # };

  services.logind = {
    extraConfig = ''
      HandlePowerKey=suspend
      HandleLidSwitch=suspend
    '';
  };
}
