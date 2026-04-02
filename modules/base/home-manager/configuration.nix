{ self, inputs, ...}: {

  flake.home-manager.nixosModules.homeManagerConfig = {
    home-manager.backupFileExtension = "bak";
    home-manager.overwriteBackup = true;
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
    home-manager.users.yippie = self.homeManagerModules.homeManagerUserConfig;
  };
}
