{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.NixVMHardware = {
    config,
    lib,
    pkgs,
    modulesPath,
    ...
  }: {
    imports = [];

    boot.initrd.availableKernelModules = [
      "ata_piix"
      "uhci_hcd"
      "ehci_pci"
      "ahci"
      "nvme"
      "sr_mod"
    ];
    boot.initrd.kernelModules = [];
    boot.kernelModules = [];
    boot.extraModulePackages = [];

    fileSystems."/" = {
      device = "/dev/disk/by-label/NixOS";
      fsType = "ext4";
    };

    fileSystems."/boot" = {
      device = "/dev/disk/by-label/Boot";
      fsType = "vfat";
      options = [
        "fmask=0077"
        "dmask=0077"
      ];
    };

    swapDevices = [];

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  };
}
