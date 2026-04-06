{ self, inputs, ...}: {
  flake.nixosModules.desktop = { pkgs, ... }: {
    programs.appimage.enable = true;
    programs.appimage.binfmt = true;
    programs.appimage.package = pkgs.appimage-run.override {
      extraPkgs = pkgs: [
        pkgs.python312
      ];
    };
  };
}
