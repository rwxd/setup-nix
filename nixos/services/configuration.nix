# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "services";
  networking.networkmanager.enable = true;
  networking.interfaces.eth0.ipv4.addresses = [{
    address = "192.168.2.32";
    prefixLength = 23;
  }];
  networking.defaultGateway = "192.168.2.1";
  networking.nameservers = [ "192.168.2.1" "1.1.1.1" "8.8.8.8" ];

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    # keyMap = "de";
    useXkbConfig = true; # use xkbOptions in tty.
  };

  # Users
  users.users.fwrage = {
    isNormalUser = true;
    extraGroups = [ "wheel" "NetworkManager" "docker" ];
    packages = with pkgs; [ ];
    initialPassword = "initialPW";
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDFPlflmLbEqiNMMXTlSAEVQZepLimyg9S6B5PsJ98Ti id_ed25519"
    ];
  };

  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    tmux
    docker-compose
    htop
    neofetch
    borgmatic
    borgbackup
  ];

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    passwordAuthentication = false;
    kbdInteractiveAuthentication = false;
    permitRootLogin = "yes";
  };

  virtualisation.docker = { enable = true; };

  # Enable cron service
  services.cron = {
    enable = true;
    systemCronJobs = [
      "*/5 * * * * root date >> /tmp/cron.log"
      # nextcloud
      ''
        0 0 * * 1 root ${pkgs.docker}/bin/docker exec -u www-data nextcloud-app php /var/www/html/occ preview:generate-all
      ''
      ''
        */15 * * * * root ${pkgs.docker}/bin/docker exec -u www-data nextcloud-app php /var/www/html/occ preview:pre-generate
      ''
      "*/5 * * * * root ${pkgs.docker}/bin/docker exec -u www-data nextcloud-app php -f /var/www/html/cron.php 2>&1 >> /var/logs/nextcloud-cron"
    ];
  };

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 22 80 443 8080 ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  networking.firewall.enable = true;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.05"; # Did you read the comment?
}
