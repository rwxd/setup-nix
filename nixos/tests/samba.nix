{ pkgs, ... }: {
  # To make SMB mounting easier on the command line
  environment.systemPackages = with pkgs; [ cifs-utils ];
  services.samba-wsdd.enable =
    true; # make shares visible for windows 10 clients
  networking.firewall.allowedTCPPorts = [
    5357 # wsdd
  ];
  networking.firewall.allowedUDPPorts = [
    3702 # wsdd
  ];

  # This part may be optional for your needs, but I find it makes browsing in Dolphin easier,
  # and it makes connecting from a local Mac possible.
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    publish = {
      enable = true;
      addresses = true;
      domain = true;
      hinfo = true;
      userServices = true;
      workstation = true;
    };
    extraServiceFiles = {
      smb =
        "	<?xml version=\"1.0\" standalone='no'?><!--*-nxml-*-->\n	<!DOCTYPE service-group SYSTEM \"avahi-service.dtd\">\n	<service-group>\n	  <name replace-wildcards=\"yes\">%h</name>\n	  <service>\n		<type>_smb._tcp</type>\n		<port>445</port>\n	  </service>\n	</service-group>\n  ";
    };
  };
}
