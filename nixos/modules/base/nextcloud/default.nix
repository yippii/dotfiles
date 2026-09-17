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
<<<<<<< HEAD
    services.logind.settings.Login.HandleLidSwitch = "ignore";
    services.logind.settings.Login.HandleLidSwitchExternalPower = "ignore";

    environment.systemPackages = with pkgs; [exiftool ffmpeg];
=======
    services.logind.lidSwitch = "ignore";
    services.logind.lidSwitchExternalPower = "ignore";
>>>>>>> refs/remotes/origin/main

    services.nextcloud = {
      enable = true;
      package = pkgs.nextcloud33;
      hostName = "yippie-nextcloud.drake-istrian.ts.net";
      https = true;

      database.createLocally = true;

      configureRedis = true;

<<<<<<< HEAD
      config.dbtype = "sqlite";
      config.adminuser = null;
=======
      config.adminpassFile = "/etc/nextcloud-pass";
      config.dbtype = "sqlite";
      config.overwriteProtocol = "https";
>>>>>>> refs/remotes/origin/main

      extraAppsEnable = true;
      extraApps = {
        inherit (config.services.nextcloud.package.packages.apps) news contacts calendar tasks;
<<<<<<< HEAD
        memories = pkgs.fetchNextcloudApp {
          sha256 = "sha256-B+O78qjBQbmMnFAvH/5a+YBive+rkBG9AKTX7G3qNR0=";
          url = "https://github.com/pulsejet/memories/releases/download/v8.0.1/memories.tar.gz";
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
=======
      };

      settings.trusted_domains = [
        "yippie-nextcloud.drake-istrian.ts.net"
      ];
>>>>>>> refs/remotes/origin/main
    };

    services.nginx.virtualHosts.${config.services.nextcloud.hostName} = {
      enableACME = false;
      sslCertificate = "/var/lib/tailscale/certs/yippie-nextcloud.drake-istrian.ts.net.crt";
      sslCertificateKey = "/var/lib/tailscale/certs/yippie-nextcloud.drake-istrian.ts.net.key";
<<<<<<< HEAD
    };

    services.avahi = {
      enable = true;
      nssmdns4 = true;
      publish = {
        enable = true;
        addresses = true;
        workstation = true;
      };
=======

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
>>>>>>> refs/remotes/origin/main
    };

    networking.firewall.allowedTCPPorts = [80 443];
  };
}
