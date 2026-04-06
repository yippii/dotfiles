{ inputs, self, ... }: {
  flake.nixosModules.desktop = { lib, pkgs, ... }: {
    imports = [ inputs.auto-cpufreq.nixosModules.default ];

    programs.auto-cpufreq = lib.mkMerge [
      (lib.mkIf pkgs.stdenv.isx86_64 {
        enable = true;
        settings = {
          charger = {
            governor = "performance";
            turbo = "always";
          };

          battery = {
            governor = "powersave";
            turbo = "never";
          };
        };
      })

      (lib.mkIf pkgs.stdenv.isAarch64 {
        enable = false;
      })
    ];
  };
}
