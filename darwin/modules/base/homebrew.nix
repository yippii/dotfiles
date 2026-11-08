{
  config,
  inputs,
  ...
}: {
  imports = [inputs.nix-homebrew.darwinModules.nix-homebrew];

  nix-homebrew = {
    enable = true;

    user = "libor";

    autoMigrate = true;

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
      "mantrakp04/tap/ardia"
    ];

    onActivation = {
      cleanup = "uninstall";
      autoUpdate = false;
      upgrade = false;
    };
  };
}
