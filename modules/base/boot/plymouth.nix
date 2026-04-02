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
        "systemd.show_status=false"
        "usbcore.autosuspend=-1"
      ];

      loader.timeout = 0;
    };
  };
}
