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
    services.cockpit = {
      enable = true;
      port = 10000;

      settings = {
        WebService.AllowUnencrypted = true;
      };
    };
  };
}
