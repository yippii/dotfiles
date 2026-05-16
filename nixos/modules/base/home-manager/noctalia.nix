{
  self,
  inputs,
  ...
}: {
  flake.homeModules.noctalia = {pkgs, ...}: {
    imports = [inputs.noctalia.homeModules.default];

    wayland.windowManager.hyprland.systemd.enable = true;
    wayland.windowManager.hyprland.systemd.variables = ["--all" "XDG_RUNTIME_DIR" "XDG_SESSION_ID"];

    programs.noctalia = {
      enable = true;
      settings = {
        bar = {
          order = [ "default" ];
          default = {
            capsule = true;
            capsule_groups = [ "brightness+vol" "buttons_left" "buttons_right" "buttons_mid" ];
            capsule_radius = 5.0;
            center = [ "clock" "media" ];
            end = [ "tray" "network" "bluetooth" "volume" "brightness" "battery" "clipboard" "control-center" "session" ];
            margin_edge = 5;
            margin_ends = 30;
            position = "left";
            radius = 7;
            start = [ "launcher" "notifications" "workspaces" ];
            widget_spacing = 3;
          };
        };
        desktop_widgets = {
          schema_version = 1;
          widget_order = [ "desktop-widget-0000000000000001" "desktop-widget-0000000000000002" "desktop-widget-0000000000000003" ];
          grid = {
            cell_size = 16;
            major_interval = 4;
            visible = true;
          };
          widget = {
            desktop-widget-0000000000000001 = {
              cx = 1454.75732421875;
              cy = 292.0;
              output = "eDP-1";
              rotation = 0.0;
              scale = 0.7739878296852112;
              type = "audio_visualizer";
              settings = {
                aspect_ratio = 2.5;
                bands = 32;
              };
            };
            desktop-widget-0000000000000002 = {
              cx = 1454.491943359375;
              cy = 400.20001220703125;
              output = "eDP-1";
              rotation = 0.0;
              scale = 1.0;
              type = "weather";
            };
            desktop-widget-0000000000000003 = {
              cx = 1342.9959716796875;
              cy = 135.6016082763672;
              output = "eDP-1";
              rotation = 0.0;
              scale = 1.6754032373428345;
              type = "audio_visualizer";
              settings = {
                aspect_ratio = 2.5;
                bands = 32;
              };
            };
          };
        };
        dock = {
          active_monitor_only = true;
          auto_hide = true;
          enabled = true;
          pinned = [ "zen-beta" "dolphin" "kitty" ];
        };
        shell = {
          corner_radius_scale = 0.5;
          password_style = "random";
          polkit_agent = true;
          settings_show_advanced = true;
          ui_scale = 0.949999988079071;
          animation = {
            speed = 1.5500000715255737;
          };
          screen_corners = {
            enabled = true;
            size = 30;
          };
        };
        theme = {
          source = "wallpaper";
          wallpaper_scheme = "m3-fruit-salad";
          templates = {
            builtin_ids = [ "hyprland" "gtk4" "gtk3" "kitty" "qt" "kcolorscheme" ];
            community_ids = [ "spicetify" "pywalfox" "vscode" ];
          };
        };
        wallpaper = {
          directory = "/home/yippie/Pictures/Wallpapers";
          default = {
            path = "/home/yippie/Pictures/Wallpapers/nix.png";
          };
          last = {
            path = "/home/yippie/Pictures/Wallpapers/nix.png";
          };
          monitors = {
            eDP-1 = {
              path = "/home/yippie/Pictures/Wallpapers/nix.png";
            };
          };
        };
        weather = {
          auto_locate = true;
        };
        widget = {
          battery = {
            capsule = true;
          };
          brightness = {
            capsule = true;
            capsule_group = "brightness+vol";
            show_label = false;
          };
          clipboard = {
            capsule = true;
            capsule_group = "buttons_right";
          };
          clock = {
            capsule = true;
            capsule_group = "buttons_mid";
          };
          control-center = {
            capsule = true;
            capsule_group = "buttons_right";
          };
          launcher = {
            capsule = true;
            capsule_group = "buttons_left";
            glyph = "rocket";
          };
          media = {
            capsule = true;
            capsule_group = "buttons_mid";
          };
          network = {
            capsule = true;
            show_label = false;
          };
          notifications = {
            capsule = true;
            capsule_group = "buttons_left";
          };
          session = {
            capsule = true;
            capsule_group = "buttons_right";
          };
          tray = {
            capsule = true;
          };
          volume = {
            capsule = true;
            capsule_group = "brightness+vol";
            show_label = false;
          };
          workspaces = {
            capsule = true;
            capsule_group = "buttons_left";
            display = "id";
          };
        };
      };
    };
  };
}
