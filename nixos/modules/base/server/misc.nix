{self, inputs, ...}: {
  flake.nixosModules.server = {...}: {
    services.logind.settings.Login = {
      HandleLidSwitch = "ignore";
      HandleLidSwitchExternalPower = "ignore";
    };
  };
}