{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.impermanance = {pkgs, ...}: {
    imports = [inputs.disko.nixosModules.disko];

    filesystem."/nix".neededForBoot = true;
    filesystem."/persistent".neededForBoot = true;

    disko = {
      devices.nodev = {
        "/" = {
          fsType = "tmpfs";
          mountOptions = [
            "size=25%"
            "mode=755"
          ];
        };
      };

      devices.disk.main = {
        device = "/dev/nvme0n1";
        type = "disk";

        content.type = "gpt";

        content.partitions.esp = {
          name = "Boot";
          size = "2G";
          type = "EF00";

          content = {
            type = "filesystem";
            format = "vfat";
            mountpoint = "/boot";
          };
        };

        content.partitions.swap = {
          name = "Swap";
          size = "4G";

          content = {
            type = "swap";
            resumeDevice = true;
          };
        };

        content.partitions.root = {
          name = "NixOS";
          size = "100%";

          content = {
            type = "btrfs";
            extraArgs = ["-f"];

            subvolumes = {
              "/persistent" = {
                mountOptions = ["subvol=persistent" "noatime"];
                mountpoint = "/persistent";
              };

              "/nix" = {
                mountOptions = ["subvol=nix" "noatime"];
                mountpoint = "/nix";
              };
            };
          };
        };
      };
    };
  };
}
