{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.desktop = {pkgs, ...}: {
    # VMWare Workstation
    virtualisation.vmware.host.enable = pkgs.stdenv.hostPlatform.isx86_64;
  };
}
