{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.homeManager = {lib, ...}: {
    imports = [inputs.home-manager.nixosModules.home-manager];

    home-manager.overwriteBackup = true;
    home-manager.backupFileExtension = "bak";
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;

    home-manager.users.yippie = {
      imports = [
        self.homeModules.zen-browser
        self.homeModules.nvim
        self.homeModules.noctalia
        self.homeModules.qt
        self.homeModules.gtk
        self.homeModules.misc
      ];
    };

    home-manager.users.root = {
      imports = [
        self.homeModules.nvim
        self.homeModules.misc
      ];

      home.username = lib.mkForce "root";
      home.homeDirectory = lib.mkForce "/root";
    };
  };
}
