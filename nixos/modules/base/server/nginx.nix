{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.server = {config, ...}: {
    services.nginx.enable = true;
    services.nginx.virtualHosts = {
      "yippie-nextcloud.drake-istrian.ts.net/nextcloud" = {
        listen = [
          {
            addr = "127.0.0.1";
            port = 80;
          }
        ];

        extraConfig = ''
          access_log /var/log/nginx/${config.services.nextcloud.hostName}.access.log;
          error_log /var/log/nginx/${config.services.nextcloud.hostName}.error.log;
        '';
      };
    };

    networking.firewall.allowedTCPPorts = [80 443];
  };
}
