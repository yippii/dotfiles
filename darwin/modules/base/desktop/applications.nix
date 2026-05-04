{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    (vscode-with-extensions.override {
      vscodeExtensions = with vscode-extensions; [
        ms-python.python
        ms-python.vscode-pylance
        ms-python.debugpy
        ms-python.mypy-type-checker
        ms-python.pylint
        mechatroner.rainbow-csv
        oracle.oracle-java
        vscjava.vscode-java-pack
        vscodevim.vim
        catppuccin.catppuccin-vsc
        catppuccin.catppuccin-vsc-icons
      ];
    })

    nicotine-plus
    qbittorrent
    whatsapp-for-mac
    signal-desktop
    discord
    kitty
    notion-app
    daisydisk
  ];
}