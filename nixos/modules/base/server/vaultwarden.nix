{self, inputs, ...}: {
  flake.nixosModules.server = {pkgs, ...}: {
    services.vaultwarden = {
        enable = true;
        # Needed to enable postgresql
        package = pkgs.vaultwarden-postgresql;
        dbBackend = "postgresql";

        # automatically inject Nginx and Postgres config
        configurePostgres = true;

        # in order to avoid having ADMIN_TOKEN and SMTP_PASSWORD in the nix store, it can also be set with the help of an environment file
        # be aware that this file must be created by hand (or via secrets management like sops)
        environmentFile = "/var/lib/vaultwarden/vaultwarden.env";
        config = {
            # Refer to https://github.com/dani-garcia/vaultwarden/blob/main/.env.template
            SIGNUPS_ALLOWED = true;
            DOMAIN = "https://vaultwarden.local";
            ROCKET_ADDRESS = "127.0.0.1";
            ROCKET_PORT = 8222;
            ROCKET_LOG = "critical";

            # This example assumes an external mailserver, for more information see:
            #   https://github.com/dani-garcia/vaultwarden/wiki/SMTP-configuration
            # Note: don't forget to add SMTP_PASSWORD in your env file
            SMTP_HOST = "smtp.resend.com";
            SMTP_PORT = "465";
            SMTP_SECURITY = "force_tls";
            SMTP_FROM = "yippie-bitwarden@resend.dev";
            SMTP_USERNAME = "resend";
            SMTP_FROM_NAME = "Yippie's Bitwarden server";
        };
    };

    networking.firewall.allowedTCPPorts = [8222];
  };
}