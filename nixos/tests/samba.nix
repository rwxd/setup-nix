{ pkgs, ... }:
{
  # To make SMB mounting easier on the command line
  environment.systemPackages = with pkgs; [
    cifs-utils
  ];
  services.samba-wsdd.enable = true; # make shares visible for windows 10 clients
  networking.firewall.allowedTCPPorts = [
    5357 # wsdd
  ];
  networking.firewall.allowedUDPPorts = [
    3702 # wsdd
  ];
  services.samba.openFirewall = true;
  services.samba = {
    enable = true;
    securityType = "user";
    extraConfig = ''
  	workgroup = workgroup
  	server string = smbnix
  	netbios name = smbnix
  	security = user
  	#use sendfile = yes
  	#max protocol = smb2
  	# note: localhost is the ipv6 localhost ::1
  	hosts allow = 192.168.122. 192.168.0. 127.0.0.1 localhost
  	hosts deny = 0.0.0.0/0
  	guest account = nobody
  	map to guest = bad user
    '';
    shares = {
		schulung = {
		  path = "/home/fwrage/schulung_share";
		  browseable = "yes";
		  "read only" = "no";
		  "guest ok" = "no";
		  # "create mask" = "0644";
		  # "directory mask" = "0755";
		  # "force user" = "username";
		  # "force group" = "groupname";
		};
		public = {
		  path = "/mnt/shares/public";
		  browseable = "yes";
		  "read only" = "no";
		  "guest ok" = "yes";
		  # "create mask" = "0644";
		  # "directory mask" = "0755";
		  # "force user" = "username";
		  # "force group" = "groupname";
		};
		private = {
		  path = "/mnt/shares/private";
		  browseable = "yes";
		  "read only" = "no";
		  "guest ok" = "no";
		  # "create mask" = "0644";
		  # "directory mask" = "0755";
		  # "force user" = "username";
		  # "force group" = "groupname";
		};
		};
	  };

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
		  smb = ''
			<?xml version="1.0" standalone='no'?><!--*-nxml-*-->
			<!DOCTYPE service-group SYSTEM "avahi-service.dtd">
			<service-group>
			  <name replace-wildcards="yes">%h</name>
			  <service>
				<type>_smb._tcp</type>
				<port>445</port>
			  </service>
			</service-group>
		  '';
		};
  };
}
