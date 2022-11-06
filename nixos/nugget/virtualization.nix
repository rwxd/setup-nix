{ pkgs, ... }:
{
  virtualisation = {
    podman = {
      enable = true;

      # Create a `docker` alias for podman, to use it as a drop-in replacement
      dockerCompat = true;

      # Required for containers under podman-compose to be able to talk to each other.
      defaultNetwork.dnsname.enable = true;
    };
  };


  virtualisation.libvirtd = {
    enable = true;
  };

  programs.dconf.enable = true;
  environment.systemPackages = with pkgs; [
    virt-manager
    virt-viewer
    virt-top
    libguestfs
  ];

  # IPv4 NAT for VMs
  boot.kernel.sysctl = { "net.ipv4.ip_forward" = 1; };

  # KVM kernel module
  boot.kernelModules = [ "kvm-intel" ];

  # Nested virtualization
  boot.extraModprobeConfig = "options kvm_intel nested=1";
}
