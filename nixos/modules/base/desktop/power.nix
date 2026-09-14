{
  inputs,
  self,
  ...
}: {
  flake.nixosModules.desktop = {
    lib,
    pkgs,
    ...
  }: {
    services.power-profiles-daemon.enable = true;

    services.logind.settings = {
      Login = {
        HandlePowerKey = "suspend";
        HandleLidSwitchDocked = "ignore";
      };
    };
  };
}
