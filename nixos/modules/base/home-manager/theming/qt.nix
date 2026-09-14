{
  self,
  inputs,
  ...
}: {
  flake.homeModules.qt = {
    pkgs,
    config,
    ...
  }: {
    home.packages = with pkgs; [
      kdePackages.dolphin
      kdePackages.kimageformats
      kdePackages.kdegraphics-thumbnailers
      kdePackages.ffmpegthumbs
      kdePackages.qtimageformats
      libsForQt5.qt5ct
      qt6Packages.qt6ct
    ];

    qt = {
      enable = true;
      style = {
        name = "Darkly";
        package = with pkgs; [darkly];
      };
      platformTheme.name = "qtct";
      kde.settings.kdeglobals.General.TerminalApplication = "kitty";
      kde.settings.kdeglobals.Icons.Theme = config.gtk.iconTheme.name;
      kde.settings.kdeglobals.UISettings.ColorScheme = "*";

      qt6ctSettings = {
        Appearance = {
          color_scheme_path = "/home/yippie/.config/qt6ct/colors/noctalia.conf";
          custom_palette = true;
          icon_theme = "Papirus-Dark";
          style = "Darkly";
        };
      };
    };

    home.activation.kdeBuildMimeCache = config.lib.dag.entryAfter ["writeBoundary"] ''
      ${pkgs.kdePackages.kservice}/bin/kbuildsycoca6 --noincremental
    '';
  };
}
