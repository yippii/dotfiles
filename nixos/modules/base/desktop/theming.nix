{ self, inputs, ... }: {
  flake.nixosModules.desktop = { lib, pkgs, ...}: {
   
    environment.systemPackages = with pkgs; [ libsForQt5.qt5ct kdePackages.qt6ct darkly darkly-qt5 ];

    qt.platformTheme = "qt5ct";

  };
}
