{self, inputs, ...}: {
  flake.nixosModules.server = {config, ...}: {
    services.nginx.virtualHosts = {
      ${config.services.nextcloud.hostName} = {
        
        enableACME = false;
        sslCertificate = "/var/lib/tailscale/certs/yippie-nextcloud.drake-istrian.ts.net.crt";
        sslCertificateKey = "/var/lib/tailscale/certs/yippie-nextcloud.drake-istrian.ts.net.key";
        

        listen = [
          {
            addr = "127.0.0.1";
            port = 80;
          }

          {
            addr = "127.0.0.1";
            port = 443;
          }
        ];
      };

      "192.168.0.92" = {
        /*
        enableACME = false;
        sslCertificate = "/var/lib/tailscale/certs/yippie-nextcloud.drake-istrian.ts.net.crt";
        sslCertificateKey = "/var/lib/tailscale/certs/yippie-nextcloud.drake-istrian.ts.net.key";
        */

        listen = [
          {
            addr = "127.0.0.1";
            port = 80;
          }

          {
            addr = "127.0.0.1";
            port = 443;
          }

          {
            addr = "127.0.0.1";
            port = 8222;
          }
        ];
      };

      "localhost" = {
        /*
        enableACME = false;
        sslCertificate = "/var/lib/tailscale/certs/yippie-nextcloud.drake-istrian.ts.net.crt";
        sslCertificateKey = "/var/lib/tailscale/certs/yippie-nextcloud.drake-istrian.ts.net.key";
        */

        listen = [
          {
            addr = "127.0.0.1";
            port = 80;
          }

          {
            addr = "127.0.0.1";
            port = 443;
          }

          {
            addr = "127.0.0.1";
            port = 8222;
          }
        ];
      };

        "yippie-nextcloud" = {
        /*
        enableACME = false;
        sslCertificate = "/var/lib/tailscale/certs/yippie-nextcloud.drake-istrian.ts.net.crt";
        sslCertificateKey = "/var/lib/tailscale/certs/yippie-nextcloud.drake-istrian.ts.net.key";
        */

        listen = [
          {
            addr = "127.0.0.1";
            port = 80;
          }

          {
            addr = "127.0.0.1";
            port = 443;
          }

          {
            addr = "127.0.0.1";
            port = 8222;
          }
        ];
      };
    };
    networking.firewall.allowedTCPPorts = [80 443];
  };
}