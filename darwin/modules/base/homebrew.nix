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
      "tonhowtf/tap" = inputs.tonhowtf-tap;
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
      "tonhowtf/tap/omniget"
    ];

    onActivation = {
      cleanup = "uninstall";
      autoUpdate = false;
      upgrade = false;
    };

    taps = builtins.attrNames config.nix-homebrew.taps;
  };
}
