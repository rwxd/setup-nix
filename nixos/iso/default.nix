{ pkgs, config, ... }: {
  home-manager.users."nixos" = import ../../home-manager/iso;

  time.timeZone = "Europe/Berlin";

  environment.systemPackages = with pkgs; [ vim curl tmux git ];

  console = {
    font = "Lat2-Terminus16";
    # keyMap = "de";
    useXkbConfig = true; # use xkbOptions in tty.
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.nixos = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;
    packages = with pkgs; [ ];
    initialPassword = "initialPW";
  };

  programs.zsh.enable = true;

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  networking.hostName = "nugget"; # Define your hostname.

  networking.networkmanager.enable =
    true; # Easiest to use and most distros use this by default.

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 22 ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = true;
}
