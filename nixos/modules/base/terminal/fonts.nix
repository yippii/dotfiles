{inputs, self, ...}: {
  flake.nixosModules.terminal = {pkgs, ...}: {
    # Font Packages
    fonts.packages = with pkgs; [
      nerd-fonts.meslo-lg
      nerd-fonts.jetbrains-mono
      google-fonts
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
      source-han-sans
      corefonts
      vista-fonts
      roboto
      kodiPackages.robotocjksc
    ];
  };
}