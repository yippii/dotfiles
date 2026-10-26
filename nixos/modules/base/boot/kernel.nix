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
    nixpkgs.overlays = [inputs.cachyos-kernel.overlays.pinned];

    boot.kernelPackages = lib.mkIf pkgs.stdenv.hostPlatform.isx86_64 pkgs.cachyosKernels.linuxPackages-cachyos-bore-x86_64-v4;
  };
}
