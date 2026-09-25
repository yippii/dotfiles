{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.AI = {pkgs, ...}: {
    environment.systemPackages = [pkgs.opencode-desktop];
  };
}
