{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.NixOS-NextcloudHardware = {
    config,
    lib,
    pkgs,
    ...
  }: {
    boot.initrd.availableKernelModules = [
    ];
    boot.initrd.kernelModules = [];
    boot.kernelModules = ["kvm-intel"];
    boot.extraModulePackages = [];

    fileSystems."/" = {
      device = "/dev/disk/by-label/NixOS";
      fsType = "ext4";
    };

    fileSystems."/boot" = {
      device = "/dev/disk/by-label/Boot";
      fsType = "vfat";
      options = [
        "fmask=0022"
        "dmask=0022"
      ];
    };

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

    hardware = {
      firmware = [pkgs.linux-firmware];

      cpu = {
        intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
      };
    };
  };
}
