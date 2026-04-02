{ self, inputs, ...}: {

  flake.nixosConfigurations.NixOS-P1 = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      self.nixosModules.NixOS-P1Config

      inputs.home-manager.nixosModules.home-manager
      self.home-manager.nixosModules.homeManagerConfig

      inputs.lanzaboote.nixosModules.lanzaboote
      self.nixosModules.lanzabooteConfig

      inputs.hyprdynamicmonitors.nixosModules.default
    ];
  };
}
