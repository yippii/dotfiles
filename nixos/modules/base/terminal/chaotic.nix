{self, inputs, ...}: {
  flake.nixosModules.terminal = {
    imports = [inputs.chaotic.nixosModules.default];
  };
}
