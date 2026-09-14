{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.noctalia-shell = {pkgs, ...}: {
    services.upower = {
      enable = true;
    };

    services.dbus.packages = with pkgs; [
      upower
    ];

    environment.systemPackages = with pkgs; [
      inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
      grim
      slurp
      tesseract
      imagemagick
      zbar
      translate-shell
      ffmpeg
      wl-screenrec
      gifski
      gpu-screen-recorder

      swappy
      kitty
      app2unit
      papirus-icon-theme
    ];
  };
}
