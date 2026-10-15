{self, inputs, ...}: {
  flake.nixosModules.desktop = {pkgs, ...}: {
    imports = [ inputs.nix-flatpak.nixosModules.nix-flatpak ];

    services.flatpak = {
      enable = true;
      packages = [
        "org.desktop_plus.desktop-plus"
        "org.gtk.Gtk3theme.adw-gtk3"
        "org.gtk.Gtk3theme.adw-gtk3-dark"
        "org.vinegarhq.Sober"
      ];

      uninstallUnmanaged = true;
    };
  };
}
