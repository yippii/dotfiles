{ self, inputs, ... }:
{
  flake.nixosModules.desktop =
    { lib, pkgs, ... }:
    {

      services.gnome.gnome-keyring.enable = true;

      security.pam.services = {
        login.enableGnomeKeyring = true;
        sddm.enableGnomeKeyring = true;
        #sddm.fprintAuth = false;
      };

      security.polkit.enable = true;

      #services.fprintd.enable = true;

      systemd.user.services.polkit-soteria = {
        description = "polkit-soteria";
        wantedBy = [ "graphical-session.target" ];
        serviceConfig = {
          Type = "simple";
          ExecStart = "${pkgs.soteria}/bin/soteria";
          Restart = "on-failure";
          RestartSec = 1;
          TimeoutStopSec = 10;
        };
      };
    };
}
