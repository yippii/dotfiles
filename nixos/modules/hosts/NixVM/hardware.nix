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
    swapDevices = [];

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  };
}
