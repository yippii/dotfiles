{self, inputs, ...}: {
  flake.nixosModules.server = {config, ...}: {
    services.nginx.enable = true;
    services.nginx.virtualHosts = {
      ${config.services.nextcloud.hostName} = {
        enableACME = false;
        sslCertificate = "/var/lib/tailscale/certs/yippie-nextcloud.drake-istrian.ts.net.crt";
        sslCertificateKey = "/var/lib/tailscale/certs/yippie-nextcloud.drake-istrian.ts.net.key";

        listen = [
          {
            addr = "localhost";
            port = 80;
          }

          {
            addr = "localhost";
            port = 443;
          }
        ];
      };
    };
    
    networking.firewall.allowedTCPPorts = [80 443];
  };
}