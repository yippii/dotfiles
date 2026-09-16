{self, inputs, ...}: {
  flake.nixosModules.AI = {pkgs, ...}: {
    services.ollama = {
      enable = true;
      package = pkgs.ollama-cuda;
    };
  };
}