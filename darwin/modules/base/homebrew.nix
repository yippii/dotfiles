{
  config,
  inputs,
  ...
}: {
  imports = [inputs.nix-homebrew.darwinModules.nix-homebrew];

  nix-homebrew = {
    enable = true;

    enableRosetta = true;

    user = "libor";

    autoMigrate = true;

    # Optional: Declarative tap management
    taps = {
      "homebrew/homebrew-core" = inputs.homebrew-core;
      "homebrew/homebrew-cask" = inputs.homebrew-cask;
      "desktop-plus/tap" = inputs.desktop-plus-tap;
    };

    mutableTaps = true;
  };

  homebrew = {
    enable = true;
    enableFishIntegration = true;

    brews = [
      "libiconv"
    ];

    casks = [
      "bitwarden"
      "keyguard"
      "keka"
      "github"
      "cloudflare-warp"
      "vorssaint"
      "desktop-plus/tap/desktop-plus"
    ];

    onActivation = {
      cleanup = "uninstall";
      autoUpdate = false;
      upgrade = false;
    };

    taps = builtins.attrNames config.nix-homebrew.taps;
  };
}
