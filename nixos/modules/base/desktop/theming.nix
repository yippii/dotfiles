{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.desktop = {pkgs, ...}: {
    imports = [inputs.stylix.nixosModules.stylix];

    environment.systemPackages = [inputs.darkly.packages.${pkgs.stdenv.hostPlatform.system}.darkly-qt5];

    qt = {
      enable = true;
    #  style = "breeze";
      platformTheme = "qt5ct";
    };

    stylix = {
      enable = true;
      base16Scheme = {
        scheme = "Noctalia Generated";
        author = "Noctalia Shell Dynamic Engine";
        base00 = "#10131c";
        base01 = "#10131c";
        base02 = "#414659";
        base03 = "#10131c";
        base04 = "#003543";
        base05 = "#e1e1ef";
        base06 = "#003543";
        base07 = "#e1e1ef";
        base08 = "#ffb4ab";
        base09 = "#ffb4ab";
        base0A = "#87d1eb";
        base0B = "#b4c5ff";
        base0C = "#87d1eb";
        base0D = "#5cd5fb";
        base0E = "#b4c5ff";
        base0F = "#5cd5fb";
      };
      polarity = "dark";
      autoEnable = true;

      fonts = {
        serif = {
          package = pkgs.nerd-fonts.meslo-lg;
          name = "MesloLGS Nerd Font";
        };

        sansSerif = {
          package = pkgs.noto-fonts;
          name = "Noto Sans";
        };

        monospace = {
          package = pkgs.nerd-fonts.meslo-lg;
          name = "MesloLGS Nerd Font Mono";
        };

        emoji = {
          package = pkgs.noto-fonts-color-emoji;
          name = "Noto Color Emoji";
        };
      };

      targets = {
        fish.enable = false;
        spicetify.enable = false;
        gtksourceview.enable = false;
        qt = {
          enable = true;
          polarity.enable = true;
        };
      };
    };
  };
}
