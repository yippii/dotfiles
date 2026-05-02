{ self, inputs, ... }: {

  flake.nixosModules.terminal = { pkgs, ... }: {

    environment.systemPackages = with pkgs; [
      fish
      starship
      fastfetch
    ];

    programs.fish.enable = true;

    users.users.yippie.shell = pkgs.fish;

    console = {
      font = "${pkgs.terminus_font}/share/consolefonts/ter-u32b.psf.gz";
      packages = with pkgs; [ terminus_font ];
      keyMap = "us";
      earlySetup = true;
    };
  
    systemd.services.systemd-vconsole-setup.unitConfig.After = "local-fs.target";
  };
}
