{ self, inputs, ... }: {

  flake.nixosModules.desktop = { lib, pkgs, ... }: {

    services.sysprof.enable = true;

    services.gvfs.enable = true;

    services.flatpak.enable = true;
    xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    xdg.portal.config.common.default = "gtk";

    programs.nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 4d --keep 3";
      flake = "/etc/nixos";
    };

    environment = {
      systemPackages = with pkgs; lib.mkMerge [
        [
        nautilus
        quodlibet
        easyeffects
        github-desktop
        android-tools
        ] 
      
        (lib.mkIf pkgs.stdenv.isx86_64 [
          discord
        ])

        (lib.mkIf pkgs.stdenv.isAarch64 [
          vesktop
        ])
      ];

      sessionVariables.NIXOS_OZONE_WL = "1";
    };
  };
}
