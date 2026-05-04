{ inputs, pkgs, config, self, ... }: {
  imports = [
    (inputs.import-tree ../../base)
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs = {
    config.allowUnfree = true;
    hostPlatform = "aarch64-darwin";
  };

  system = {
    primaryUser = "libor";
    stateVersion = 6;
    configurationRevision = self.rev or self.dirtyRev or null;
  };

  users.users."libor" = {
    home = "/users/libor";
    shell = pkgs.fish;
  };
}
