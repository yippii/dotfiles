# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.NixVMConfig = {
    config,
    lib,
    pkgs,
    ...
  }: {
    imports = [
      self.nixosModules.homeManager

      self.nixosModules.NixVMHardware

      inputs.lanzaboote.nixosModules.lanzaboote
      self.nixosModules.umbriel
      self.nixosModules.noctalia-shell
      self.nixosModules.desktop
      self.nixosModules.terminal
      self.nixosModules.boot
      self.nixosModules.impermanance
    ];

    boot.loader.efi.efiSysMountPoint = "/boot";

    boot.kernelPackages = pkgs.linuxPackages_latest;

    networking.hostName = "NixVM";
    networking.networkmanager.enable = true;

    time.timeZone = "America/Toronto";

    services.printing.enable = true;

    services.pipewire = {
      enable = true;
      pulse.enable = true;
    };

    services.libinput.enable = true;

    users.users.yippie = {
      isNormalUser = true;
      extraGroups = ["wheel"];
      packages = with pkgs; [
        starship
      ];
    };

    programs.firefox.enable = true;

    environment.systemPackages = with pkgs; [
      wget
      curl
      git
    ];

    virtualisation.vmware.guest.enable = true;

    # Copy the NixOS configuration file and link it from the resulting system
    # (/run/current-system/configuration.nix). This is useful in case you
    # accidentally delete configuration.nix.
    # system.copySystemConfiguration = true;

    # This option defines the first version of NixOS you have installed on this particular machine,
    # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
    #
    # Most users should NEVER change this value after the initial install, for any reason,
    # even if you've upgraded your system to a new NixOS release.
    #
    # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
    # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
    # to actually do that.
    #
    # This value being lower than the current NixOS release does NOT mean your system is
    # out of date, out of support, or vulnerable.
    #
    # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
    # and migrated your data accordingly.
    #
    # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
    system.stateVersion = "26.05"; # Did you read the comment?

    nix.settings.experimental-features = [
      "nix-command"
      "flakes"
    ];

    nixpkgs.config.allowUnfree = true;
  };
}
