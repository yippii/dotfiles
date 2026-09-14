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
        base00 = "#070B14";
        base01 = "#1B232E";
        base02 = "#303C48";
        base03 = "#445462";
        base04 = "#596C7C";
        base05 = "#6E8496";
        base06 = "#829DAF";
        base07 = "#accee4";
        base08 = "#1C1A1E";
        base09 = "#262126";
        base0A = "#1C1D22";
        base0B = "#13151A";
        base0C = "#17181E";
        base0D = "#2C2B33";
        base0E = "#0D1017";
        base0F = "#1F212A";
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
        zen-browser.enable = false;
      };
    };
  };
}
