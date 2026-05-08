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
      style.package = with pkgs; [
        darkly
        darkly-qt5
      ];
      platformTheme.name = "qtct";
      kde.settings.kdeglobals.General.TerminalApplication = "kitty";
      kde.settings.kdeglobals.Icons.Theme = config.gtk.iconTheme.name;
      kde.settings.kdeglobals.UISettings.ColorScheme = "*";
    };
  };
}
