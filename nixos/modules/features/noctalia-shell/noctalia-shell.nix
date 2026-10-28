{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.noctalia-shell = {pkgs, ...}: {
    imports = [inputs.noctalia.nixosModules.default];

    programs.noctalia = {
      enable = true;
      package = inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default;
      recommendedServices.enable = true;
      systemd.enable = true;
    };

    services.dbus.packages = with pkgs; [
      upower
    ];

    environment.systemPackages = with pkgs; [
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
