{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.terminal = {pkgs, ...}: {
    nixpkgs.overlays = [
      (final: prev: {
        nix-output-monitor = prev.nix-output-monitor.override {
          extraComposeFunctions = [
            (prev.haskell.lib.compose.appendPatch (
              prev.fetchpatch2 {
                url = "https://patch-diff.githubusercontent.com/raw/maralorn/nix-output-monitor/pull/321.patch";
                relative = "nix-output-monitor";
                hash = "sha256-uleti4hBzGN/uQS7CxUi4FaVs+fy+Q/rmqDPNPXBNiM=";
              }
            ))
          ];
        };

        nh = prev.nh.override {
          inherit (final) nix-output-monitor;
        };
      })
    ];

    programs.nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 4d --keep 3";
      flake = "/etc/nixos";
    };

    nix = {
      package = inputs.determinate-nix.packages.${pkgs.stdenv.hostPlatform.system}.default;
      settings = {
        lazy-trees = false;
        eval-cores = 0;
        trusted-users = ["nixremote"];
        substituters = [
          "https://nix-community.cachix.org"
          "https://cache.nixos.org/"
          "https://noctalia.cachix.org"
          "https://nixos-apple-silicon.cachix.org"
          "https://comfyui.cachix.org"
          "https://zed.cachix.org"
          "https://cache.xinux.uz"
          "https://install.determinate.systems"
          #"https://cache.nixos-cuda.org"
        ];
        trusted-public-keys = [
          "nix-community.cachix.org-2:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
          "nixos-apple-silicon.cachix.org-2:8psDu5SA5dAD7qA0zMy5UT292TxeEPzIz8VVEr2Js20="
          "noctalia.cachix.org-2:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
          "comfyui.cachix.org-2:33mf9VzoIjzVbp0zwj+fT51HG0y31ZTK3nzYZAX0rec="
          "zed.cachix.org-2:/pHQ6dpMsAZk2DiP4WCL0p9YDNKWj2Q5FL20bNmw1cU="
          "cache.xinux.uz:BXCrtqejFjWzWEB8YuGB7X2MV4ttBur1N8BkwQRdH+0="
          "cache.flakehub.com-3:hJuILl5sVK4iKm86JzgdXW12Y2Hwd5G07qKtHTOcDCM="
          #"cache.nixos-cuda.org:73DUi4Ye579gUqzH4ziL9IyiJBlDpMRn9MBN8oNan9M="
        ];
      };
    };
  };
}
