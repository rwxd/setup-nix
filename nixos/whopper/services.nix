{ pkgs, ... }:
{
  services.blueman.enable = true;

  security.pam.services.kdewallet.enableKwallet = true;

  services.logind = {
    extraConfig = ''
      HandlePowerKey=suspend
      HandleLidSwitch=suspend
    '';
  };
}