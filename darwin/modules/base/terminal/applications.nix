{pkgs, ...}: {
  nix = {
    settings = {
      substituters = [
        "https://nix-community.cachix.org"
        "https://cache.nixos.org/"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    # Nix
    nixfmt
    nixd
    nh

    # Standard stuff
    git
    wget
    curl
    ffmpeg

    # Terminal
    starship
    yt-dlp
    pfetch

    # Development
    platformio
    qmk

    # Java
    openjdk
    maven
    gradle

    # C
    gcc
    llvm

    # JS
    nodejs

    # Formatters
    statix
    alejandra
    deadnix

    # Misc
    darwin.libiconv
    android-tools

    (python314.withPackages (
      python-pkgs:
        with python-pkgs; [
          black
          isort
          mypy
          pylint
          turtle
        ]
    ))
  ];
}
