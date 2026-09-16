{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations.NixVM = inputs.nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      self.nixosModules.NixVMConfig
    ];
  };
}
