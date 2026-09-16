{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.impermanance = {pkgs, ...}: {
    imports = [inputs.preservation.nixosModules.default];

    preservation = {
      enable = true;

      preserveAt."/persistent" = {
        directories = [
          "/etc/nixos"
          "/var/lib/bluetooth"
          "/var/lib/bluetooth"
          "/var/lib/fprint"
          "/var/lib/fwupd"
          "/var/lib/libvirt"
          "/var/lib/power-profiles-daemon"
          "/var/lib/systemd/coredump"
          "/var/lib/systemd/rfkill"
          "/var/lib/systemd/timers"
          "/var/lib/sbctl"
          "/var/log"
          {
            directory = "/var/lib/nixos";
            inInitrd = true;
          }
        ];

        files = [
          {
            file = "/etc/machine-id";
            inInitrd = true;
          }
          "/var/lib/usbguard/rules.conf"

          # creates a symlink on the volatile root
          # creates an empty directory on the persistent volume, i.e. /persistent/var/lib/systemd
          # does not create an empty file at the symlink's target (would require `createLinkTarget = true`)
          {
            file = "/var/lib/systemd/random-seed";
            how = "symlink";
            inInitrd = true;
            configureParent = true;
          }
        ];

        # Preserve user files
        users.yippie = {
          directories = [
            {
              directory = ".ssh";
              mode = "0700";
            }
            ".mozilla"
            ".config"
            ".ollama"
            ".local/state/noctalia"
            "Downloads"
            "Desktop"
            "Documents"
            "Games"
            "Music"
            "Pictures"
            "Projects"
            "Videos"
            "vmware"
          ];
          files = [
          ];
        };
      };
    };
  };
}
