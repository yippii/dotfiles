{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.noctalia-shell = {pkgs, ...}: {
    users.groups.fan_ctl = {};
    users.users.yippie.extraGroups = ["fan_ctl"];
    boot.extraModprobeConfig = ''
      options thinkpad_acpi fan_control=1
    '';
    services.udev.extraRules = ''
      ACTION=="add|bind", SUBSYSTEM=="platform", DRIVER=="thinkpad_acpi", RUN+="${pkgs.coreutils}/bin/chgrp fan_ctl /proc/acpi/ibm/fan", RUN+="${pkgs.coreutils}/bin/chmod 0664 /proc/acpi/ibm/fan"
    '';
  };
}
