{self, inputs, ...}: {
  flake.nixosModules.server = {config, ...}: {
    services.nginx.virtualHosts = {
      ${config.services.nextcloud.hostName} = {

        extraConfig = ''
          access_log /var/log/nginx/${config.services.nextcloud.hostName}.access.log;
          error_log /var/log/nginx/${config.services.nextcloud.hostName}.error.log;
        '';

        locations."/" = {
          proxyPass = "http://127.0.0.1:${toString config.services.vaultwarden.config.ROCKET_PORT}";
          proxyWebsockets = true;
          extraConfig = ''
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
          '';
        };
        
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

        extraConfig = ''
          access_log /var/log/nginx/192.168.0.92.access.log;
          error_log /var/log/nginx/192.168.0.92.error.log;
        '';
        
        locations."/" = {
          proxyPass = "http://127.0.0.1:${toString config.services.vaultwarden.config.ROCKET_PORT}";
          proxyWebsockets = true;
          extraConfig = ''
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
          '';
        };

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

        extraConfig = ''
          access_log /var/log/nginx/localhost.access.log;
          error_log /var/log/nginx/localhost.error.log;
        '';
        
        locations."/" = {
          proxyPass = "http://127.0.0.1:${toString config.services.vaultwarden.config.ROCKET_PORT}";
          proxyWebsockets = true;
          extraConfig = ''
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
          '';
        };

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

        extraConfig = ''
          access_log /var/log/nginx/yippie-nextcloud.access.log;
          error_log /var/log/nginx/yippie-nextcloud.error.log;
        '';

        locations."/" = {
          proxyPass = "http://127.0.0.1:${toString config.services.vaultwarden.config.ROCKET_PORT}";
          proxyWebsockets = true;
          extraConfig = ''
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
          '';
        };

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