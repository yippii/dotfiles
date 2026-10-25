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

    # To enable network-discovery
    services.avahi = {
      enable = true;
      nssmdns4 = true; # printing
      openFirewall = true; # ensuring that firewall ports are open as needed

      settings = {
        publish = {
          disable-publishing = false;
          disable-user-service-publishing = false;
          publish-addresses = true;
          publish-workstation = true;
          publish-domain = true;
        };
      };
    };
  };
}
