{ self, inputs, ... }:
{
  flake.nixosModules.hyprland =
    { lib, pkgs, ... }:
    {
      services.dbus.packages = with pkgs; [ hyprdynamicmonitors ];

      environment.systemPackages = with pkgs; [ hyprdynamicmonitors ];

      services.hyprdynamicmonitors = {
        enable = true;
        mode = "user";
        configFile = lib.mkMerge [
          (lib.mkIf pkgs.stdenv.isx86_64 "/home/yippie/.config/hyprdynamicmonitors/config-nig.toml")
          (lib.mkIf pkgs.stdenv.isAarch64 "/home/yippie/.config/hyprdynamicmonitors/config-mac.toml")
        ];
      };
    };
}
