{self, inputs, ...}: {
  flake.nixosModules.terminal = {pkgs, ...}: {
    users.users.yippie = {
      isNormalUser = true;
      extraGroups = ["wheel" "networkmanager"];
      packages = with pkgs; [
        starship
      ];
    };
  };
}