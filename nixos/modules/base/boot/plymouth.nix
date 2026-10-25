{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.boot = {
    config,
    lib,
    pkgs,
    ...
  }: {
    boot = {
      plymouth = {
        enable = true;
        #theme = "bgrt";
        extraConfig = "ShowDelay=5";
      };

      consoleLogLevel = 0;
      kernelParams = lib.mkMerge [
        [
          "quiet"
          "splash"
        ]
      ];

      #loader.timeout = 0;
    };
  };
}
