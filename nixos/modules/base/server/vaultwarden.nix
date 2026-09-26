{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.server = {pkgs, ...}: {
    services.vaultwarden = {
      enable = true;

      environmentFile = "/var/lib/vaultwarden/vaultwarden.env";
      config = {
        # Refer to https://github.com/dani-garcia/vaultwarden/blob/main/.env.template
        SIGNUPS_ALLOWED = true;
        DOMAIN = "https://yippie-nextcloud.drake-istrian.ts.net";
        ROCKET_ADDRESS = "yippie-nextcloud.drake-istrian.ts.net";
        ROCKET_PORT = 8222;
        ROCKET_LOG = "critical";
      };
    };

    networking.firewall.allowedTCPPorts = [8222];
  };
}
