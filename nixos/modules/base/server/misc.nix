{self, inputs, ...}: {
  flake.nixosModules.server = {...}: {
    services.logind.lidSwitch = "ignore";
    services.logind.lidSwitchExternalPower = "ignore";
  };
}