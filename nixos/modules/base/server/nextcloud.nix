{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.server = {
    config,
    pkgs,
    ...
  }: {
    services.nextcloud = {
      enable = true;
      package = pkgs.nextcloud35;
      hostName = "127.0.0.1";
      https = true;

      database.createLocally = true;

      configureRedis = true;

      config.adminpassFile = "/etc/nextcloud-pass";
      config.dbtype = "sqlite";

      extraAppsEnable = true;
      extraApps = {
        inherit (config.services.nextcloud.package.packages.apps) contacts calendar music onlyoffice tasks;
      };

      settings = {
        trusted_domains = [
          "yippie-nextcloud.drake-istrian.ts.net"
          "192.168.0.92"
        ];

        overwriteprotocol = "http";
        overwritehost = "127.0.0.1";
        overwritewebroot = "/nextcloud";
        overwrite.cli.url = "http://127.0.0.1/nextcloud/";
        htaccess.RewriteBase = "/nextcloud";
      };
    };
  };
}
