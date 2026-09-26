{self, inputs, ...}: {
  flake.nixosModules.server = {config, ...}: {
    services.nginx.enable = true;
    services.nginx.virtualHosts = {
      "127.0.0.1" = {

        listen = [
          {
            addr = "127.0.0.1";
            port = 67;
          }

          {
            addr = "127.0.0.1";
            port = 8222;
          }
        ];

        extraConfig = ''
          access_log /var/log/nginx/${config.services.nextcloud.hostName}.access.log;
          error_log /var/log/nginx/${config.services.nextcloud.hostName}.error.log;
        '';
      };

      "localhost" = {
        "/nextcloud/" = {
          priority = 9999;
          extraConfig = ''
            access_log /var/log/nginx/nextcloud.access.log;
            error_log /var/log/nginx/nextcloud.error.log;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-NginX-Proxy true;
            proxy_set_header X-Forwarded-Proto http;
            proxy_pass http://127.0.0.1:67/; # tailing / is important!
            proxy_set_header Host $host;
            proxy_cache_bypass $http_upgrade;
            proxy_redirect off;
          '';
        };
                
        "/" = {
          proxyWebsockets = true;
          extraConfig = ''
            access_log /var/log/nginx/nextcloud.access.log;
            error_log /var/log/nginx/nextcloud.error.log;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-NginX-Proxy true;
            proxy_set_header X-Forwarded-Proto http;
            proxy_pass http://127.0.0.1:8222/; # tailing / is important!
            proxy_set_header Host $host;
            proxy_cache_bypass $http_upgrade;
            proxy_redirect off;
          '';
        };
      };

      "yippie-nextcloud" = {
        extraConfig = ''
          access_log /var/log/nginx/yippie-nextcloud.access.log;
          error_log /var/log/nginx/yippie-nextcloud.error.log;
        '';

        "/nextcloud/" = {
          priority = 9999;
          extraConfig = ''
            access_log /var/log/nginx/nextcloud.access.log;
            error_log /var/log/nginx/nextcloud.error.log;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-NginX-Proxy true;
            proxy_set_header X-Forwarded-Proto http;
            proxy_pass http://127.0.0.1:67/; # tailing / is important!
            proxy_set_header Host $host;
            proxy_cache_bypass $http_upgrade;
            proxy_redirect off;
          '';
        };
                
        "/" = {
          proxyWebsockets = true;
          extraConfig = ''
            access_log /var/log/nginx/nextcloud.access.log;
            error_log /var/log/nginx/nextcloud.error.log;
            proxy_set_header X-Real-IP $remote_addr;
            proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header X-NginX-Proxy true;
            proxy_set_header X-Forwarded-Proto http;
            proxy_pass http://127.0.0.1:8222/; # tailing / is important!
            proxy_set_header Host $host;
            proxy_cache_bypass $http_upgrade;
            proxy_redirect off;
          '';
        };
      };
    };
    
    networking.firewall.allowedTCPPorts = [80 443];
  };
}