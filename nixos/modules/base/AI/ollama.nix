{self, inputs, ...}: {
  flake.nixosModules.AI = {pkgs, ...}: {
    services.ollama = {
      enable = true;
      package = pkgs.ollama-cuda;
      host = "127.0.0.1";
      port = 11434;
    };
  };
}