{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.server = {
    lib,
    pkgs,
    ...
  }: {

    environment.systemPackages = [pkgs.kitty.terminfo];

    services.openssh = {
      enable = true;

      ports = [6767];

      settings = {
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = true;
        PermitRootLogin = "no";
        AllowUsers = ["yippie"];
      };
    };
  };
}
