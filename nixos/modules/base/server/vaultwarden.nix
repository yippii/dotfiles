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
        SIGNUPS_ALLOWED = true;
        DOMAIN = "https://yippie-nextcloud.drake-istrian.ts.net";
        ROCKET_ADDRESS = "yippie-nextcloud.drake-istrian.ts.net";
        ROCKET_PORT = 8222;
        ROCKET_LOG = "critical";
        WEB_VAULT_ENABLED = true;
      };
      backupDir = "/var/backup/vaultwarden";
    };

    networking.firewall.allowedTCPPorts = [8222];
  };
}
