{ inputs, pkgs, ... }: {
 imports = [ inputs.spicetify-nix.darwinModules.default ];

  programs.spicetify = {
      enable = true;
      theme = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system}.themes.hazy;

      enabledExtensions = with inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system}.extensions; [
        adblock
        hidePodcasts
        shuffle # shuffle+ (special characters are sanitized out of extension names)
      ];
  };
}