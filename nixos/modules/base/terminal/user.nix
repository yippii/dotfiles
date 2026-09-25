{self, inputs, ...}: {
  flake.nixosModules.terminal = {pkgs, ...}: {
    users.users.yippie = {
      isNormalUser = true;
      extraGroups = ["users" "wheel" "networkmanager" "fan_ctl" "docker"];
      hashedPassword = "$y$j9T$sPD9XKBpoHYT5V6V4vyB1.$3y9QoI/6plAaaqbrLsz9XwH3ALPauspShrxwOAdsXt.";
      packages = with pkgs; [
        starship
      ];
    };

    users.groups.docker = {
      members = ["yippie"];
     };
  };
}