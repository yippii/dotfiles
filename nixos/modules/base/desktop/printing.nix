{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.desktop = {pkgs, ...}: {
    services.printing = {
      enable = true;
      drivers = [pkgs.cnijfilter2];
    };
  };
}
