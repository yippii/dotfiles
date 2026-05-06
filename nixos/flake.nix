{
  description = "yippie nix flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";

    wrapper-modules.url = "github:BirdeeHub/nix-wrapper-modules";
  
    noctalia.url = "github:noctalia-dev/noctalia-shell";
    noctalia.inputs.nixpkgs.follows = "nixpkgs";

    nix4nvchad.url = "github:nix-community/nix4nvchad";
    nix4nvchad.inputs.nixpkgs.follows = "nixpkgs";
    nix4nvchad.inputs.nvchad-starter.follows = "nvchad-starter";

    nvchad-starter.url = "github:yippii/nvchad-starter";
    nvchad-starter.flake = false;

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    sine.url = "github:CosmoCreeper/Sine?rev=a48b73d32a074d710a1193294d432a62e436b8cf";
    sine.flake = false;
    sine-bootloader.url = "github:sineorg/bootloader?rev=ad1c91019196c3d7d43730f5dd0ddc278f9e3a6e";
    sine-bootloader.flake = false;
    nebula-zen.url = "github:JustAdumbPrsn/Zen-Nebula";
    nebula-zen.flake = false;

    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    zen-browser.inputs.nixpkgs.follows = "nixpkgs";
    zen-browser.inputs.home-manager.follows = "home-manager";

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";

    hyprdynamicmonitors.url = "github:fiffeek/hyprdynamicmonitors";

    nix-gaming.url = "github:fufexan/nix-gaming";
    nix-gaming.inputs.nixpkgs.follows = "nixpkgs";

    lanzaboote.url = "github:nix-community/lanzaboote/v1.0.0";
    lanzaboote.inputs.nixpkgs.follows = "nixpkgs";

    nixos-apple-silicon.url = "github:nix-community/nixos-apple-silicon?rev=b6d1d07d55831902cb188a40692a5c7b5529e9e0";
    nixos-apple-silicon.inputs.nixpkgs.follows = "nixpkgs";

    dolphin-overlay.url = "github:rumboon/dolphin-overlay";
    dolphin-overlay.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs: 
  inputs.flake-parts.lib.mkFlake { inherit inputs; } {
    imports = [
      (inputs.import-tree ./modules)
    ];
  };
}
