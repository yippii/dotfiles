{ self, inputs, ... }: {

  flake.nixosModules.desktop = { pkgs, ... }: {

    environment.systemPackages = with pkgs; [
      (vscode-with-extensions.override {
        vscodeExtensions = with vscode-extensions; [
          jnoortheen.nix-ide
          ms-python.python
          vscjava.vscode-java-pack
          ms-vscode.cpptools
          catppuccin.catppuccin-vsc
          catppuccin.catppuccin-vsc-icons
        ];
      })
    ];


  };
}
