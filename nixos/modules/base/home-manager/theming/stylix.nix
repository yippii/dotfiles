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

      targets = {
        gtk = {
          enable = true;
          colors.enable = true;
          flatpakSupport.enable = true;
        };

        kde.enable = true;
        kitty.enable = false;
        fish.enable = false;
        fish.colors.enable = false;
        noctalia.enable = false;
        spicetify.enable = false;
        qt = {
          enable = false;
          colors.enable = false;
        };
      };
    };
  };
}
