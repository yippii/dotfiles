{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.terminal = {
    config,
    lib,
    pkgs,
    ...
  }: {
    programs.nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 4d --keep 3";
      flake = "/etc/nixos";
      package = pkgs.nh.override {
        nix-output-monitor = pkgs.nix-output-monitor;
      };
    };

    nix = {
      package = inputs.determinate-nix.packages.${pkgs.stdenv.hostPlatform.system}.default;
      settings = {
        trusted-users = ["nixremote"];
        extra-substituters = [
          "https://nix-community.cachix.org"
          "https://noctalia.cachix.org"
          "https://nixos-apple-silicon.cachix.org"
          "https://comfyui.cachix.org"
          "https://zed.cachix.org"
          "https://cache.xinux.uz"
          "https://install.determinate.systems"
          "https://zed-industries.cachix.org"
          #"https://cache.nixos-cuda.org"
        ];
        trusted-public-keys = [
          "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
          "nix-community.cachix.org-2:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
          "nixos-apple-silicon.cachix.org-2:8psDu5SA5dAD7qA0zMy5UT292TxeEPzIz8VVEr2Js20="
          "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
          "comfyui.cachix.org-2:33mf9VzoIjzVbp0zwj+fT51HG0y31ZTK3nzYZAX0rec="
          "zed.cachix.org-1:/pHQ6dpMsAZk2DiP4WCL0p9YDNKWj2Q5FL20bNmw1cU="
          "cache.xinux.uz:BXCrtqejFjWzWEB8YuGB7X2MV4ttBur1N8BkwQRdH+0="
          "cache.flakehub.com-3:hJuILl5sVK4iKm86JzgdXW12Y2Hwd5G07qKtHTOcDCM="
          "zed-industries.cachix.org-1:QW3RoXK0Lm4ycmU5/3bmYRd3MLf4RbTGPqRulGlX5W0="
          #"cache.nixos-cuda.org:73DUi4Ye579gUqzH4ziL9IyiJBlDpMRn9MBN8oNan9M="
        ];
      };
    };
  };
}
