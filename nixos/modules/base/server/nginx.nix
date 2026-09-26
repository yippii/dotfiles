{self, inputs, ...}: {
  flake.nixosModules.server = {config, ...}: {
    services.nginx.enable = true;
    services.nginx.virtualHosts = {
      ${config.services.nextcloud.hostName} = {

        extraConfig = ''
          access_log /var/log/nginx/${config.services.nextcloud.hostName}.access.log;
          error_log /var/log/nginx/${config.services.nextcloud.hostName}.error.log;
        '';

        locations."/" = {
          proxyPass = "http://127.0.0.1:8080";
          proxyWebsockets = true;
          extraConfig = ''
            proxy_set_header Host $host;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-Forwarded-Proto $scheme;
          '';
        };
      };

      "localhost" = {
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
      };

      "yippie-nextcloud" = {
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
      };
    };
    networking.firewall.allowedTCPPorts = [80 443];
  };
}