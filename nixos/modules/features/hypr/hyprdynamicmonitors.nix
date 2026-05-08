{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.hyprland = {
    lib,
    pkgs,
    ...
  }: {
    services.dbus.packages = with pkgs; [hyprdynamicmonitors];

    environment.systemPackages = with pkgs; [hyprdynamicmonitors];

    services.hyprdynamicmonitors = {
      enable = true;
      mode = "user";
      config = lib.mkMerge [
        (lib.mkIf pkgs.stdenv.isx86_64 ''
          [general]
          destination = "$HOME/.config/hypr/monitors.conf"

          [power_events]

          [power_events.dbus_query_object]
          path = "/org/freedesktop/UPower/devices/line_power_AC"

          [[power_events.dbus_signal_match_rules]]
          object_path = "/org/freedesktop/UPower/devices/line_power_AC"


          [profiles.Laptop]
          config_file = "/home/yippie/.config/hyprdynamicmonitors/hyprconfigs_P1/Laptop.go.tmpl"
          config_file_type = "template"
          [profiles.Laptop.conditions]

          [[profiles.Laptop.conditions.required_monitors]]
          description = "BOE 0x0AE0"
          monitor_tag = "monitor0"


          [profiles.Desktop]
          config_file = "/home/yippie/.config/hyprdynamicmonitors/hyprconfigs_P1/Desktop.go.tmpl"
          config_file_type = "template"
          [profiles.Desktop.conditions]

          [[profiles.Desktop.conditions.required_monitors]]
          description = "BOE 0x0AE0"
          monitor_tag = "monitor0"

          [[profiles.Desktop.conditions.required_monitors]]
          description = "LG Electronics LG ULTRAGEAR 408NTCZ3F411"
          monitor_tag = "monitor1"

        '')

        (lib.mkIf pkgs.stdenv.isAarch64 ''
          [general]
          destination = "$HOME/.config/hypr/monitors.conf"

          [power_events]

          [power_events.dbus_query_object]
          path = "/org/freedesktop/UPower/devices/line_power_AC"

          [[power_events.dbus_signal_match_rules]]
          object_path = "/org/freedesktop/UPower/devices/line_power_AC"


          [profiles.Laptop]
          config_file = "/home/yippie/.config/hyprdynamicmonitors/hyprconfigs/Laptop.go.tmpl"
          config_file_type = "template"
          [profiles.Laptop.conditions]

          [[profiles.Laptop.conditions.required_monitors]]
          description = "BOE 0x0AE0"
          monitor_tag = "monitor0"


          [profiles.Desktop]
          config_file = "/home/yippie/.config/hyprdynamicmonitors/hyprconfigs/Desktop.go.tmpl"
          config_file_type = "template"
          [profiles.Desktop.conditions]

          [[profiles.Desktop.conditions.required_monitors]]
          description = "BOE 0x0AE0"
          monitor_tag = "monitor0"

          [[profiles.Desktop.conditions.required_monitors]]
          description = "LG Electronics LG ULTRAGEAR 408NTCZ3F411"
          monitor_tag = "monitor1"
        '')
      ];
    };
  };
}
