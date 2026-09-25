{self, inputs, ...}: {
  flake.nixosModules.desktop = {pkgs, ...}: {
    environment.systemPackages = [pkgs.winboat];
  };
}