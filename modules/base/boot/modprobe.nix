{ self, inputs, ... }: {
  flake.nixosModules.boot = { pkgs, ... }: {
    boot.extraModprobeConfig = ''
    options thinkpad_acpi fan_control=1
    '';
  };
}
