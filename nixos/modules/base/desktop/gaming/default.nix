{
  inputs,
  self,
  ...
}: {
  flake.nixosModules.desktop = {
    lib,
    pkgs,
    ...
  }:
    lib.mkMerge [
      (lib.mkIf pkgs.stdenv.hostPlatform.isx86_64 {
        boot.kernelModules = ["ntsync"];

        programs.steam = {
          enable = true;
          gamescopeSession.enable = true;

          extraCompatPackages = with pkgs; [
            proton-ge-bin
          ];

          extraPackages = with pkgs; [
            SDL2
            gamescope
            er-patcher
          ];
        };

        programs.gamemode.enable = true;

        environment.systemPackages = with pkgs; [
          mangohud
          osu-lazer-bin
          lutris
          vulkan-tools
        ];
      })
    ];
}
