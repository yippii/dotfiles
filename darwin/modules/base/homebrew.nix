{ config, inputs, ... }:
{
  imports = [ inputs.nix-homebrew.darwinModules.nix-homebrew ];

  nix-homebrew = {
    enable = true;

    enableRosetta = true;

    user = "libor";

    autoMigrate = true;

    # Optional: Declarative tap management
    taps = {
      "homebrew/homebrew-core" = inputs.homebrew-core;
      "homebrew/homebrew-cask" = inputs.homebrew-cask;
      "osx-cross/homebrew-arm" = inputs.homebrew-osx-cross-arm;
      "osx-cross/homebrew-avr" = inputs.homebrew-osx-cross-avr;
      "qmk/homebrew-qmk" = inputs.homebrew-qmk;
    };

    mutableTaps = false;
  };

  homebrew = {
    enable = true;
    enableFishIntegration = true;

    brews = [
      "osx-cross/arm/arm-none-eabi-binutils"
      "osx-cross/arm/arm-none-eabi-gcc@8"
      "libiconv"
    ];

    casks = [
      "bitwarden"
      "keyguard"
      "keka"
      "github"
      "cloudflare-warp"
    ];

    onActivation = {
      cleanup = "uninstall";
      autoUpdate = false;
      upgrade = false;
    };

    taps = builtins.attrNames config.nix-homebrew.taps;
  };
}
