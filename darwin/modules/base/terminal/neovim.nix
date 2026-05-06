{ inputs, pkgs, ... }:
{
  environment.systemPackages = [
    inputs.nix4nvchad.packages."${pkgs.stdenv.hostPlatform.system}".nvchad
  ];
}
