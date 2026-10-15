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
    services.sysprof.enable = true;

    services.gvfs.enable = true;

    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [xdg-desktop-portal-hyprland kdePackages.xdg-desktop-portal-kde];
      config.common.default = ["hyprland" "kde"];
    };

    environment = {
      systemPackages = with pkgs;
        [
          quodlibet
          easyeffects
          android-tools
          sublime-merge
          # animeko
          ani-cli
          yt-dlp
          signal-desktop
          nicotine-plus
          qbittorrent
          kdePackages.ark
          unrar
          opencode-desktop
          vesktop
          kdePackages.kinfocenter
          vlc
          mpv
          superfile

          uxplay
          # Ensure GStreamer plugins are available for rendering audio/video
          gst_all_1.gstreamer
          gst_all_1.gst-plugins-good
          gst_all_1.gst-plugins-bad

          libpulseaudio
          glib
          libX11
          libXext
          libXrender
          libXrandr
          libXdamage
          libXcursor
          libXcomposite
          libayatana-appindicator
        ]
        ++ [inputs.zed.packages.${pkgs.stdenv.hostPlatform.system}.default];

      sessionVariables.NIXOS_OZONE_WL = "1";
    };
  };
}
