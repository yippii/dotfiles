{ inputs, ... }:
{
  imports = [ inputs.home-manager.darwinModules.home-manager ];

  home-manager.overwriteBackup = true;
  home-manager.backupFileExtension = "bak";
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.libor = {
    imports = [
      inputs.nix4nvchad.homeManagerModule
      ./_modules/nvim.nix
      ./_modules/starship.nix
    ];

    home.stateVersion = "26.05"; # Please read the comment before changing.

    # home.packages = with pkgs; [];

    home.sessionVariables = { };

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;
  };
}
