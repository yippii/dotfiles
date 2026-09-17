{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.nextcloud = {
    config,
    pkgs,
    ...
  }: {
    services.logind.settings.Login.HandleLidSwitch = "ignore";
    services.logind.settings.Login.HandleLidSwitchExternalPower = "ignore";

    environment.systemPackages = with pkgs; [exiftool ffmpeg];

    services.nextcloud = {
      enable = true;
      package = pkgs.nextcloud34;
      hostName = "yippie-nextcloud.drake-istrian.ts.net";
      https = true;

      database.createLocally = true;

      configureRedis = true;

      config.adminuser = null;
      config.dbtype = "sqlite";
      config.overwriteProtocol = "https";

      extraAppsEnable = true;
      extraApps = {
        inherit (config.services.nextcloud.package.packages.apps) news contacts calendar tasks;
        memories = pkgs.fetchNextcloudApp {
          sha256 = "sha256-xrGXpjBVvW4qtlrPynGh8c2ImmJ/u0itqHETZND0nzA=";
          url = "https://github.com/pulsejet/memories/releases/download/v9.0.1/memories.tar.gz";
          license = "agpl3Only";
        };
      };

      settings = {
        log_type = "file";

        overwriteprotocol = "https";
        trusted_domains = [
          "yippie-nextcloud.drake-istrian.ts.net"
          "192.168.0.92"
          "yippie-nextcloud"
          "yippie-nextcloud.local"
          "192.168.1.1"
        ];

        mail_smtphost = "smtp.gmail.com";
        mail_smtpport = 587;
        mail_smtpauth = true;
      };
    };

    services.nginx.virtualHosts.${config.services.nextcloud.hostName} = {
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

    services.avahi = {
      enable = true;
      nssmdns4 = true;
      publish = {
        enable = true;
        addresses = true;
        workstation = true;
      };
    };

    networking.firewall.allowedTCPPorts = [80 443];
  };
}
