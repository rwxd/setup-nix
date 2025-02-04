# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, lib, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./virtualization.nix
    ./services.nix
    ./ledger.nix
    ./lutris.nix
    ../tests/samba.nix
  ];

  nix.gc = {
    automatic = true;
    randomizedDelaySec = "14m";
    options = "--delete-older-than 90d";
    dates = "weekly";
  };

  home-manager.users."fwrage" = import ../../home-manager/whopper/home.nix;

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = lib.mkForce false;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/etc/secureboot";
  };

  networking.hostName = "whopper"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable =
    true; # Easiest to use and most distros use this by default.
  programs.nm-applet.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Berlin";
  # for dualboot with windows
  time.hardwareClockInLocalTime = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_MESSAGES = "en_US.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  console = {
    font = "Lat2-Terminus16";
    # keyMap = "de";
    useXkbConfig = true; # use xkbOptions in tty.
  };

  services = {
    displayManager = {
      enable = true;
      defaultSession = "none+i3";
    };

    # Enable the X11 windowing system.
    xserver = {
      enable = true;
      dpi = 220;
      videoDrivers = [ "amdgpu" ];
      displayManager = {
        lightdm.enable = true;
        # defaultSession = "plasma";
        sessionCommands = ''
          ${pkgs.xorg.xrdb}/bin/xrdb -merge <${
            pkgs.writeText "Xresources" ''
              Xft.dpi: 150
              Xcursor.theme: Adwaita
              Xcursor.size: 36
            ''
          }
        '';
      };
      # Enable the Plasma 5 Desktop Environment.
      desktopManager.plasma5.enable = true;
      windowManager.i3 = {
        enable = true;
        package = pkgs.i3-gaps;
      };
    };
  };

  boot.initrd.kernelModules = [ "amdgpu" ];
  # enable vulkan
  # hardware.opengl.driSupport = true;
  ## For 32 bit applications
  # hardware.opengl.driSupport32Bit = true;

  # Configure keymap in X11
  services.xserver.xkb.layout = "de";
  services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  services.printing.enable = true;

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Enable bluetooth
  hardware.bluetooth = { enable = true; };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.fwrage = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "libvirtd"
      "video"
      "audio"
      "lp"
      "scanner"
      "networkmanager"
      "plugdev"
      "docker"
      "adbusers"
    ]; # Enable ‘sudo’ for the user.
    initialPassword = "initialPW";
    shell = pkgs.zsh;
    packages = with pkgs; [ firefox bcc ];
  };
  programs.zsh.enable = true;

  programs.adb.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs;
    with inputs.nix-alien.packages.${system}; [
      vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
      wget
      git
      tmux
      nix-alien
      nix-index # not necessary, but recommended
      nix-index-update
      restic
      autorestic
      bcc
      sbctl
      pulseaudio # for pactl, pipewire is still used
    ];

  # fonts
  fonts.packages = with pkgs; [
    fira-code
    fira-code-symbols
    font-awesome
    font-awesome_4
    font-awesome_5
  ];

  nixpkgs.config.permittedInsecurePackages = [ "python3.10-certifi-2022.12.7" ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = false;
  };

  services.cron = {
    enable = true;
    systemCronJobs = [
      "* * * * * fwrage pacmd set-source-volume alsa_input.usb-Burr-Brown_from_TI_USB_Audio_CODEC-00.analog-stereo-input 0x20000"
      "*/5 * * * * root autorestic --ci cron"
    ];
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.openssh.ports = [ 22 ];

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 22 ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

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

