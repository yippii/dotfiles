{
  inputs,
  pkgs,
  ...
}: {
  environment.systemPackages = [inputs.zed.packages.${pkgs.stdenv.hostPlatform.system}.default];
}
