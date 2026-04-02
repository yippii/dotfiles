{ self, inputs, ... }: {
  flake.nixosModules.desktop = { lib, pkgs, ...}: {

    services.gnome.gnome-keyring.enable = true;

    security.pam.services = {
      login.enableGnomeKeyring = true;
      sddm.enableGnomeKeyring = true;
      sddm.fprintAuth = false;
  };

    security.polkit.enable = true;

    services.fprintd.enable = true;


    systemd.user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };
}
