{ pkgs, ... }: {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      function fish_greeting
        fastfetch
      end

      starship init fish | source
    '';
    
    shellAliases = {
      darwin-update = "cd /etc/nix-darwin && nix flake update && nh darwin switch . && nh clean all -k 3 && cd ~";
    };
  };

  fonts.packages = with pkgs; [
  nerd-fonts.meslo-lg
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
}