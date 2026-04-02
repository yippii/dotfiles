{ self, inputs, ... }: {

  flake.nixosModules.hyprland = { pkgs, ... }: {
    programs.hyprland = {
      enable = true;
      withUWSM = true;
    };

    services.upower = {
      enable = true;
    };

    services.dbus.packages = with pkgs; [
      upower
      hyprdynamicmonitors
    ];

    environment.systemPackages = with pkgs; [
      swappy
      kitty
      app2unit
      papirus-icon-theme
      polkit_gnome
      hyprdynamicmonitors
      hyprlock
      hypridle
    ];
  };
}
