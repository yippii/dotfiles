{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.desktop = {pkgs, ...}: {
    imports = [inputs.vice.nixosModules.default];

    services.vice.enable = true;
    services.vice.package = inputs.vice.packages.${pkgs.stdenv.hostPlatform.system}.vice-clipper.overrideAttrs (_: {
      doInstallCheck = false;
    });
  };
}
