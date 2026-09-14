{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.desktop = {pkgs, ...}: {
    networking.nameservers = ["1.1.1.1#one.one.one.one" "1.0.0.1#one.one.one.one"];

    services.resolved = {
      enable = true;
      settings.Resolve = {
        DNSOverTLS = "true";
        DNSSEC = "true";
        Domains = ["~."];
        FallbackDNS = ["1.1.1.1#one.one.one.one" "1.0.0.1#one.one.one.one"];
      };
    };

    services.avahi = {
      enable = true;
      nssmdns4 = true;
    };
  };
}
