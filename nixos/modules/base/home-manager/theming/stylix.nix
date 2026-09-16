{
  self,
  inputs,
  ...
}: {
  flake.homeModules.theming = {...}: {
    stylix = {
      enable = true;
      base16Scheme = {
        scheme = "Noctalia Generated";
        author = "Noctalia Shell Dynamic Engine";
        base00 = "#10131c";
        base01 = "#10131c";
        base02 = "#10131c";
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

      targets = {
        gtk = {
          enable = true;
          colors.enable = true;
          flatpakSupport.enable = true;
        };

        qt = {
          enable = true;
          colors.enable = true;
          icons.enable = true;
          polarity.enable = true;
        };

        vscode = {
          enable = true;
          colors.enable = true;
        };

        kitty.enable = false;
        fish.enable = false;
        fish.colors.enable = false;
        noctalia.enable = false;
        spicetify.enable = false;
        gtksourceview.enable = false;
        zen-browser.enable = false;
      };
    };
  };
}
