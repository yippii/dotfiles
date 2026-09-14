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
    imports = [inputs.noctalia-greeter.nixosModules.default];

    services = {
      greetd = {
        enable = true;
        settings = {
          default_session = {
            user = "yippie";
          };
        };
      };

      displayManager.noctalia-greeter = {
        enable = true;
        package = inputs.noctalia-greeter.packages.${pkgs.stdenv.hostPlatform.system}.default;

        # Optional configuration
        greeter-args = "";
        settings.cursor = {
          theme = "catppuccin-macchiato-dark-cursors";
          size = 24;
          package = pkgs.catppuccin-cursors.macchiatoDark;
        };
      };
    };

    environment.etc."greetd/environments".text = ''
      uwsm start -e -D Hyprland hyprland.desktop
      Hyprland
      fish
      bash
    '';
  };
}
