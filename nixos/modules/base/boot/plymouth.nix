{ self, inputs, ... }:
{
  flake.nixosModules.boot =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    {
      boot = {
        plymouth = {
          enable = true;
          theme = "bgrt";
          extraConfig = "ShowDelay=5";
        };

        consoleLogLevel = 0;
        initrd.verbose = false;
        kernelParams = lib.mkMerge [
          ([
            "quiet"
            "splash"
            "udev.log_level=0"
            "udev.log_priority=0"
            "usbcore.autosuspend=-1"
          ])

          (lib.mkIf pkgs.stdenv.isx86_64 [
            "acpi=force"
          ])
        ];

        #loader.timeout = 0;
      };
    };
}
