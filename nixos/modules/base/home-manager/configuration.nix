{ self, inputs, ...}: {

  flake.home-manager.nixosModules.homeManagerConfig = {
    home-manager.overwriteBackup = true;
    home-manager.backupFileExtension = "bak";
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
    home-manager.users.yippie = self.homeManagerModules.homeManagerUserConfig;
  };
}
