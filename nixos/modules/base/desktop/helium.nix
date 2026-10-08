{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.desktop = {pkgs, ...}: {
    imports = [inputs.helium-browser.nixosModules.default];

    programs.helium = {
      enable = true;

      flags = [
        "--ozone-platform-hint=auto"
      ];

      policies = {
        "BrowserSignin" = 0;
        "PasswordManagerEnabled" = false;
        "SyncDisabled" = true;
        "SpellcheckEnabled" = true;
        "SpellcheckLanguage" = ["en-US"];
      };
    };
  };
}
