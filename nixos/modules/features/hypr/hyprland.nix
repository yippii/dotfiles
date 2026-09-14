{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.hyprland = {pkgs, ...}: {
    programs.hyprland = {
      enable = true;
      withUWSM = true;
    };

    environment.systemPackages = with pkgs; [
      swappy
      kitty
      app2unit
      papirus-icon-theme
      hyprlock
      hypridle
    ];
  };
}
