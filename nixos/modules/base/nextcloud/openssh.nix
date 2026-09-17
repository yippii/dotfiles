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
<<<<<<< HEAD
    environment.systemPackages = [pkgs.kitty.terminfo];

=======
>>>>>>> refs/remotes/origin/main
    services.openssh = {
      enable = true;

      ports = [6767];

      settings = {
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = true;
<<<<<<< HEAD
        PermitRootLogin = "yes";
        AllowUsers = ["yippie" "root"];
=======
        PermitRootLogin = "no";
        AllowUsers = ["yippie"];
>>>>>>> refs/remotes/origin/main
      };
    };
  };
}
