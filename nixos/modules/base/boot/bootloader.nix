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
    environment.systemPackages = with pkgs;
      lib.mkIf pkgs.stdenv.hostPlatform.isx86_64 [
        sbctl
      ];

    boot.loader.grub.enable = false;

    boot.loader.systemd-boot = lib.mkMerge [
      (lib.mkIf pkgs.stdenv.hostPlatform.isx86_64 {
        enable = false;
      })
      (lib.mkIf pkgs.stdenv.hostPlatform.isAarch64 {
        enable = true;
      })
    ];

    boot.lanzaboote = lib.mkMerge [
      (lib.mkIf pkgs.stdenv.hostPlatform.isx86_64 {
        enable = true;
        pkiBundle = "/var/lib/sbctl";
      })

      (lib.mkIf pkgs.stdenv.hostPlatform.isAarch64 {
        enable = false;
      })
    ];

    boot.loader.timeout = 0;
  };
}
