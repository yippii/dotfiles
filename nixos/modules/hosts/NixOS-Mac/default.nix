{ self, inputs, ...}: {

  flake.nixosConfigurations.NixOS-Mac = inputs.nixpkgs.lib.nixosSystem {
    system = "aarch64-linux";
    modules = [
      self.nixosModules.NixOS-MacConfig

      inputs.home-manager.nixosModules.home-manager
      self.home-manager.nixosModules.homeManagerConfig

      inputs.hyprdynamicmonitors.nixosModules.default
    ];
  };
}
