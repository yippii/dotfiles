{ self, inputs, ... }: {

  flake.nixosModules.terminal = { pkgs, ... }: {
    environment.systemPackages = [ inputs.nix4nvchad.packages."${pkgs.stdenv.hostPlatform.system}".nvchad pkgs.wl-clipboard ] ;
  };
}
