{ pkgs, ... }:
{
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
    nixfmt
    nixd
    nh
    git
    wget
    curl
    starship
    yt-dlp
    platformio
    qmk
    openjdk
    maven
    gradle
    nodejs
    statix
    alejandra
    deadnix
    darwin.libiconv

    (python314.withPackages (
      python-pkgs: with python-pkgs; [
        black
        isort
        mypy
        pylint
        turtle
      ]
    ))
  ];
}
