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
