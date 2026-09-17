{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.nextcloud = {pkgs, ...}: {
    environment.systemPackages = [pkgs.ethtool];

    networking.firewall.checkReversePath = "loose";

    services.networkd-dispatcher = {
      enable = true;
      rules."50-tailscale-optimizations" = {
        onState = ["routable"];
        script = ''
          ${pkgs.ethtool}/bin/ethtool -K eth0 rx-udp-gro-forwarding on rx-gro-list off
        '';
      };
    };

    services.tailscale.useRoutingFeatures = "both";
  };
}
