{
  inputs,
  pkgs,
  ...
}: {
  nix = {
    settings = {
      extra-substituters = [
        "https://nix-community.cachix.org"
        "https://cache.nixos.org"
        "https://zed.cachix.org"
        "https://cache.numtide.com"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "zed.cachix.org-1:/pHQ6dpMsAZk2DiP4WCL0p9YDNKWj2Q5FL20bNmw1cU="
        "niks3.numtide.com-1:DTx8wZduET09hRmMtKdQDxNNthLQETkc/yaX7M4qK0g="
      ];
    };
  };

  environment.variables = {
    NH_DARWIN_FLAKE = "/Users/libor/Projects/dotfiles-private/darwin";
  };
}
