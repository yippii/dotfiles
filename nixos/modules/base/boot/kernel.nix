{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.boot = {
    pkgs,
    lib,
    ...
  }: {
    boot.kernelPackages = lib.mkIf pkgs.stdenv.hostPlatform.isx86_64 pkgs.linuxPackages_cachyos;
  };
}
