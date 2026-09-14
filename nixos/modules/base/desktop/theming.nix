{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.desktop = {pkgs, ...}: {
    imports = [inputs.stylix.nixosModules.stylix];

    environment.systemPackages = with pkgs; [
      matugen
    ];

    stylix = {
      enable = true;
      base16Scheme = {
        scheme = "Noctalia Generated";
        author = "Noctalia Shell Dynamic Engine";
        base00 = "#10131c";
        base01 = "#414659";
        base02 = "#5cd5fb";
        base03 = "#e1e1ef";
        base04 = "#c1c5dd";
        base05 = "#e1e1ef";
        base06 = "#003543";
        base07 = "#003543";
        base08 = "#ffb4ab";
        base09 = "#ffb4ab";
        base0A = "#87d1eb";
        base0B = "#5cd5fb";
        base0C = "#87d1eb";
        base0D = "#b4c5ff";
        base0E = "#5cd5fb";
        base0F = "#b4c5ff";
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
