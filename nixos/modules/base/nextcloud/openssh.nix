{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.nextcloud = {
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
        PermitRootLogin = "yes";
        AllowUsers = ["yippie" "root"];
      };
    };
  };
}
