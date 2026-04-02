{ self, inputs, ... }: {
  flake.nixosModules.desktop = { pkgs, ... }: {
    imports = [ inputs.spicetify-nix.nixosModules.default ];

    programs.spicetify = {
      enable = true;
      theme = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system}.themes.hazy;

      enabledExtensions = with inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system}.extensions; [
        adblock
        hidePodcasts
        shuffle # shuffle+ (special characters are sanitized out of extension names)
      ];
    };
  };
}
