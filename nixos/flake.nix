{
  description = "yippie nix flake";

  inputs = {
    # -------- BASIC --------
    # NixOS Base
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";

    # CachyOS Kernel
    cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel";

    # Determinate Nix
    determinate-nix.url = "github:DeterminateSystems/nix-src";

    # Dendritic Pattern
    flake-parts.url = "github:hercules-ci/flake-parts";
    import-tree.url = "github:vic/import-tree";

    # Impermenance
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    preservation.url = "github:nix-community/preservation";

    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # -------- DESKTOP --------
    # Umbriel WM
    umbriel.url = "git+https://github.com/noctalia-dev/umbriel";

    # Noctalia Shell
    noctalia.url = "github:noctalia-dev/noctalia-shell/cachix";
    noctalia-greeter.url = "github:noctalia-dev/noctalia-greeter";

    # Declarative Flatpak
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";

    # Theming with Stylix
    stylix.url = "github:nix-community/stylix";

    # Plasma Manager
    plasma-manager.url = "github:nix-community/plasma-manager";

    # Qt Darkly Widgets
    darkly.url = "github:Bali10050/Darkly";

    # Zed Editor
    zed.url = "github:zed-industries/zed/nightly";

    # Neovim Configuration
    nix4nvchad = {
      url = "github:nix-community/nix4nvchad";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nvchad-starter.follows = "nvchad-starter";
    };

    nvchad-starter = {
      url = "github:yippii/nvchad-starter";
      flake = false;
    };

    # Zen Browser
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    zen-browser.inputs.nixpkgs.follows = "nixpkgs";
    zen-browser.inputs.home-manager.follows = "home-manager";

    # Sine Mod
    sine.url = "github:CosmoCreeper/Sine?rev=a48b73d32a074d710a1193294d432a62e436b8cf";
    sine.flake = false;
    sine-bootloader.url = "github:sineorg/bootloader?rev=ad1c91019196c3d7d43730f5dd0ddc278f9e3a6e";
    sine-bootloader.flake = false;

    # Sine Mod Plugins
    nebula-zen.url = "github:JustAdumbPrsn/Zen-Nebula";
    nebula-zen.flake = false;
    zen-context-menu.url = "github:starry-AXQG/Context-Menu-Icons";
    zen-context-menu.flake = false;
    zen-data-loading-bar.url = "github:rasyidrafi/zen-deta-loading-bar";
    zen-data-loading-bar.flake = false;

    helium-browser = {
      url = "github:oxcl/nix-flake-helium-browser";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Spotify (Spicetify)
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";

    # Gaming
    nix-gaming.url = "github:fufexan/nix-gaming";
    nix-gaming.inputs.nixpkgs.follows = "nixpkgs";

    # Vice Clip
    vice.url = "github:splitshotz/Vice";

    # AI Stuff
    comfyui-nix.url = "github:utensils/comfyui-nix";

    # Unpatched binaries
    nix-alien.url = "github:thiagokokada/nix-alien";

    # -------- Device Specific --------
    # UEFI Secure Boot
    lanzaboote.url = "github:nix-community/lanzaboote/0403b4b7e8b2612657f0053a4c315e6c43eee9e6";
    lanzaboote.inputs.nixpkgs.follows = "nixpkgs";

    # Apple Silicon Macs
    nixos-apple-silicon.url = "github:nix-community/nixos-apple-silicon";
    nixos-apple-silicon.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      imports = [
        (inputs.import-tree ./modules)
      ];
    };
}
