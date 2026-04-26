{ self, inputs, ... }: {
  flake.nixosModules.boot = { config, pkgs, ...}: {
    boot = {
      plymouth = {
        enable = true;
        theme = "bgrt";
        extraConfig = ''ShowDelay=5'';
      };

      consoleLogLevel = 0;
      initrd.verbose = false;
      kernelParams = [
        "quiet"
        "splash"
        "udev.log_level=0"
        "udev.log_priority=0"
        "usbcore.autosuspend=-1"
        "acpi=force"
      ];

      loader.timeout = 0;
    };
  };
}
