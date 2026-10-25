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
      hostName = "yippie-nextcloud.drake-istrian.ts.net";
      https = true;

      database.createLocally = true;

      configureRedis = true;

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

        overwriteprotocol = "https";
        overwritehost = "yippie-nextcloud.drake-istrian.ts.net";
        overwritewebroot = "/nextcloud";
        overwrite.cli.url = "http://yippie-nextcloud.drake-istrian.ts.net/nextcloud/";
        htaccess.RewriteBase = "/nextcloud";
      };
    };
  };
}
