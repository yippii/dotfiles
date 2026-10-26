{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.desktop = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
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
    ];

    networking.firewall.allowedTCPPorts = [5353 6000 6001 7000 7001 7011 7100];
    networking.firewall.allowedUDPPorts = [5353 6000 6001 7000 7001 7011 7100];
  };
}
