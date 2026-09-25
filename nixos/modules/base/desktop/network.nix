{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.desktop = {pkgs, ...}: {
    #networking.nameservers = ["1.1.1.1#one.one.one.one" "1.0.0.1#one.one.one.one"];

    networking.networkmanager = {
      enable = true;
      #dns = "systemd-resolved";
    };

    services.cloudflare-warp.enable = true;

    services.resolved = {
      enable = true;
      #settings.Resolve = {
      #  DNSOverTLS = "true";
      #  DNSSEC = "true";
      #  Domains = ["~."];
      #FallbackDNS = ["1.1.1.1#one.one.one.one" "1.0.0.1#one.one.one.one"];
      #};
    };

    networking.firewall.allowedTCPPorts = [ 5353 6000 6001 7000 7001 7011 7100 ];
    networking.firewall.allowedUDPPorts = [ 5353 6000 6001 7000 7001 7011 7100 ];
    networking.firewall.enable = true;

    # To enable network-discovery
    services.avahi = {
      enable = true;
      nssmdns = true;  # printing
      openFirewall = true; # ensuring that firewall ports are open as needed
      publish = {
        enable = true;
        addresses = true;
        workstation = true;
        userServices = true;
        domain = true;
      };
    };
  };
}
