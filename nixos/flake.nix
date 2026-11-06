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
    determinate-nix.url = "https://flakehub.com/f/DeterminateSystems/determinate/*";

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
    umbriel.url = "github:noctalia-dev/umbriel/cachix";

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
    sine.url = "github:CosmoCreeper/Sine";
    sine.flake = false;
    sine-bootloader.url = "github:sineorg/bootloader";
    sine-bootloader.flake = false;

    # Sine Mod Plugins
    zia.url = "github:z1n-k/zia";
    zia.flake = false;

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
    llm-agents.url = "github:numtide/llm-agents.nix";

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
