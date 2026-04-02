{ self, inputs, ... }: {
  flake.nixosModules.hyprland = { pkgs, ... }: {
    services.hyprdynamicmonitors = {
      enable = true;
      mode = "user";
      configFile = "/home/yippie/.config/hyprdynamicmonitors/config.toml";
    };
  };
}
