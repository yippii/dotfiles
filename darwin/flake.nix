{
  description = "yippie nix-darwin flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    import-tree.url = "github:vic/import-tree";

    nix4nvchad.url = "github:nix-community/nix4nvchad";
    nix4nvchad.inputs.nixpkgs.follows = "nixpkgs";
    nix4nvchad.inputs.nvchad-starter.follows = "nvchad-starter";

    nvchad-starter.url = "github:yippii/nvchad-starter";
    nvchad-starter.flake = false;

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";

    nix-darwin.url = "github:nix-darwin/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    nix-homebrew.url = "github:zhaofengli/nix-homebrew";

    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };

    homebrew-osx-cross-arm = {
      url = "github:osx-cross/homebrew-arm";
      flake = false;
    };

    homebrew-osx-cross-avr = {
      url = "github:osx-cross/homebrew-avr";
      flake = false;
    };

    homebrew-qmk = {
      url = "github:qmk/homebrew-qmk";
      flake = false;
    };

    nixpkgs-patcher.url = "github:gepbird/nixpkgs-patcher";
  };

  outputs = {self, ...} @ inputs: {
    darwinConfigurations.yippie-mac = inputs.nixpkgs-patcher.lib.darwinSystem {
      system = "aarch64-darwin";

      nixpkgsPatcher.nix-darwin = inputs.nix-darwin;
      nixpkgsPatcher.nixpkgs = inputs.nixpkgs;

      nixpkgsPatcher.patches = pkgs:
        with pkgs; [
          (fetchurl {
            name = "appstream.patch";
            url = "https://patch-diff.githubusercontent.com/raw/NixOS/nixpkgs/pull/515614.diff";
            hash = "sha256-tq0rn1UHl9F0QPeQFyQe1hQ6fG247CORpHi4I53dABY=";
          })
        ];

      modules = [
        ./modules/hosts/darwin-mac/configuration.nix
      ];
      specialArgs = {
        inherit inputs self;
      };
    };
  };
}
