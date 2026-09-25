{self, inputs, ...}: {
  flake.nixosModules.server = {config, ...}: {
    services.nginx = {
      enable = true;
      recommendedProxySettings = true;
      recommendedTlsSettings = true;

      virtualHosts = {
        "192.168.0.92" = {

          locations."/" = {
            proxyPass = "http://127.0.0.1:${toString config.services.vaultwarden.config.ROCKET_PORT}";
            proxyWebsockets = true;
          };

          locations."/notifications/hub" = {
            proxyPass = "http://127.0.0.1:${toString config.services.vaultwarden.config.ROCKET_PORT}";
            proxyWebsockets = true;
          };
        };
      };
    };
  };
}