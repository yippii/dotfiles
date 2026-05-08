{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.desktop = {
    lib,
    pkgs,
    ...
  }: {
    #Dolphin MIME Association
    environment.etc."/xdg/menus/plasma-applications.menu".text =
      builtins.readFile "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";
    environment.etc."/xdg/menus/applications.menu".text =
      builtins.readFile "${pkgs.kdePackages.plasma-workspace}/etc/xdg/menus/plasma-applications.menu";
    nixpkgs.overlays = [inputs.dolphin-overlay.overlays.default];
    xdg.menus.enable = true;
    xdg.mime.enable = true;
  };
}
