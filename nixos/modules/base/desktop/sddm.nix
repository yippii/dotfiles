{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.desktop = {
    lib,
    pkgs,
    ...
  }: {
    services.displayManager = {
      sddm = {
        enable = true;

        extraPackages = with pkgs; [
          kdePackages.qtsvg
          kdePackages.qtmultimedia
          kdePackages.qtvirtualkeyboard
          kdePackages.qt5compat
          kdePackages.layer-shell-qt
        ];

        theme = "sddm-astronaut-theme";

        wayland = {
          enable = true;
          compositorCommand = "${lib.getExe' pkgs.kdePackages.kwin "kwin_wayland"} --drm --no-lockscreen --no-global-shortcuts --locale1";
        };

        settings = {
          General = {
            GreeterEnvironment = lib.concatStringsSep "," [
              "QT_WAYLAND_SHELL_INTEGRATION=layer-shell"
            ];
          };

          Theme = {
            # Both of these are nessecary otherwise the cursor isn't shown at all
            CursorTheme = "catppuccin-macchiato-dark-cursors";
            CursorSize = 24;
          };
        };
      };

      autoLogin = {
        enable = false;
        user = "yippie";
      };
    };

    environment.systemPackages = with pkgs; [
      (sddm-astronaut.override {
        embeddedTheme = "hyprland_kath";
      })

      catppuccin-cursors.macchiatoDark
    ];
  };
}
