{ self, inputs, ... }:
{

  flake.nixosModules.terminal =
    { pkgs, ... }:
    {
      programs = {

        fish = {
          enable = true;

          interactiveShellInit = ''
            function fish_greeting
              fastfetch
            end

            starship init fish | source
          '';

          shellAliases = {
            nixos-update-config = "sudo nixos-rebuild switch && sudo nix-collect-garbage -d";
            nixos-update = "cd /etc/nixos && nix flake update && nh os switch && nh clean all -k 3 && cd ~";
          };
        };
      };

      # System Packages
      environment = {
        localBinInPath = true;
      };
    };
}
