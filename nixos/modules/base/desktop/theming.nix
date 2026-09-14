{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.desktop = {pkgs, ...}: {
    imports = [inputs.stylix.nixosModules.stylix];

    environment.systemPackages = [
      inputs.matugen.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];

    stylix = {
      enable = true;
      base16Scheme = {
        scheme = "Noctalia Generated";
        author = "Noctalia Shell Dynamic Engine";
        base00 = "#000000";
        base01 = "#10131c";
        base02 = "#10131c";
        base03 = "#10131c";
        base04 = "#9f9f9f";
        base05 = "#b8b8b8";
        base06 = "#cacaca";
        base07 = "#ffffff";
        base08 = "#ffb4ab";
        base09 = "#004e60";
        base0A = "#c1c5dd";
        base0B = "#b4c5ff";
        base0C = "#5cd5fb";
        base0D = "#b6ebff";
        base0E = "#b4c5ff";
        base0F = "#87d1eb";
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
        qt.enable = false;
      };
    };
  };
}
