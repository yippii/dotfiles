{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.desktop = {
    lib,
    pkgs,
    ...
  }: {
    services.gnome.gnome-keyring.enable = true;

    security.pam.services = {
      login.enableGnomeKeyring = true;
      sddm.enableGnomeKeyring = true;
      #sddm.fprintAuth = false;
    };

    security.polkit.enable = true;

    #services.fprintd.enable = true;

    security.soteria.enable = true;
  };
}
