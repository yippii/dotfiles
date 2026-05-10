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
    environment.etc."nextcloud-pass".text = "wbc1e5BaEY@!#";

    services.nextcloud = {
      enable = true;
      package = pkgs.nextcloud33;
      hostName = "yippie-nextcloud.drake-istrian.ts.net";
      https = true;
      config.adminpassFile = "/etc/nextcloud-pass";
      config.dbType = "sqlite";

      extraAppsEnable = true;
      extraApps = {
        inherit (config.services.nextcloud.package.packages.apps) news contacts calendar tasks;
      };
    };

    services.nginx.virtualHosts.${config.services.nextcloud.hostName} = {
      forceSSL = true;
      enableACME = true;
    };

    security.acme = {
      acceptTerms = true;
      certs = {
        ${config.services.nextcloud.hostName}.email = "liboris20@gmail.com";
      };
    };
  };
}
