{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.umbriel = {pkgs, ...}: {
    imports = [inputs.umbriel.nixosModules.default];

    programs.umbriel = {
      enable = true;
    };
  };
}
