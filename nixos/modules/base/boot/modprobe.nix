{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.boot = {
    lib,
    pkgs,
    ...
  }: {
    boot.extraModprobeConfig = lib.mkMerge [
      (lib.mkIf pkgs.stdenv.hostPlatform.isx86_64 ''
        options thinkpad_acpi fan_control=1
      '')

      (lib.mkIf pkgs.stdenv.hostPlatform.isAarch64 "")
    ];
  };
}
