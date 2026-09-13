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
          order = ["default"];
          default = {
            capsule = true;
            capsule_groups = ["brightness+vol" "buttons_left" "buttons_right" "buttons_mid"];
            capsule_radius = 5.0;
            center = ["group:g2" "widget"];
            end = ["group:g1" "group:g4" "clipboard" "control-center" "session"];
            margin_edge = 5;
            margin_ends = 30;
            position = "left";
            radius = 7;
            start = ["group:g3" "workspaces"];
            widget_spacing = 3;
            capsule_group = [
              {
                accordion = false;
                accordion_direction = "end";
                enabled = true;
                fill = "surface_variant";
                id = "g1";
                members = ["tray" "recorder"];
                opacity = 1.0;
                padding = 6.0;
                radius = 5.0;
              }
              {
                accordion = false;
                accordion_direction = "end";
                enabled = true;
                fill = "surface_variant";
                id = "g2";
                members = ["clock" "media"];
                opacity = 1.0;
                padding = 6.0;
                radius = 5.0;
              }
              {
                accordion = false;
                accordion_direction = "end";
                enabled = true;
                fill = "surface_variant";
                id = "g3";
                members = ["launcher" "notifications"];
                opacity = 1.0;
                padding = 6.0;
                radius = 5.0;
              }
              {
                accordion = false;
                accordion_direction = "end";
                enabled = true;
                fill = "surface_variant";
                id = "g4";
                members = ["network" "bluetooth" "volume" "brightness" "battery"];
                opacity = 1.0;
                padding = 6.0;
                radius = 5.0;
                widget_spacing = 10;
              }
            ];
          };
        };
        calendar = {
          enabled = true;
          account = {
            liboris20 = {
              name = "Boris Li";
              type = "google";
            };
          };
        };
        desktop_widgets = {
          schema_version = 1;
          widget_order = ["desktop-widget-0000000000000001" "desktop-widget-0000000000000002" "desktop-widget-0000000000000003"];
          grid = {
            cell_size = 16;
            major_interval = 4;
            visible = true;
          };
          widget = {
            desktop-widget-0000000000000001 = {
              box_height = 0.0;
              box_width = 0.0;
              cx = 1589.0;
              cy = 213.5;
              output = "eDP-1";
              placement_height = 1067.0;
              placement_width = 1707.0;
              rotation = 0.0;
              scale = 0.7739878296852112;
              type = "audio_visualizer";
              settings = {
                aspect_ratio = 2.5;
                bands = 32;
              };
            };
            desktop-widget-0000000000000002 = {
              box_height = 0.0;
              box_width = 0.0;
              cx = 1588.734619140625;
              cy = 321.70001220703125;
              output = "eDP-1";
              placement_height = 1067.0;
              placement_width = 1707.0;
              rotation = 0.0;
              scale = 1.0;
              type = "weather";
            };
            desktop-widget-0000000000000003 = {
              box_height = 0.0;
              box_width = 0.0;
              cx = 1589.0;
              cy = 89.69999694824219;
              output = "eDP-1";
              placement_height = 1067.0;
              placement_width = 1707.0;
              rotation = 0.0;
              scale = 1.0;
              type = "sysmon";
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
          launcher_position = "start";
          pinned = ["zen-beta" "dolphin" "kitty"];
          radius = 10;
          reserve_space = false;
          show_dots = true;
        };
        idle = {
          behavior_order = ["lock" "screen-off" "suspend"];
          behavior = {
            lock = {
              action = "lock";
              enabled = true;
              timeout = 1200;
            };
            screen-off = {
              action = "screen_off";
              enabled = false;
              timeout = 660;
            };
            suspend = {
              action = "suspend";
              enabled = false;
              lock_before_suspend = true;
              timeout = 900;
            };
          };
        };
        location = {
          auto_locate = true;
        };
        lockscreen = {
          blur_intensity = 0.5399999879300594;
          blurred_desktop = true;
        };
        lockscreen_widgets = {
          enabled = true;
          schema_version = 1;
          widget_order = ["lockscreen-login-box@eDP-1"];
          grid = {
            cell_size = 16;
            major_interval = 4;
            visible = true;
          };
          widget = {
            "lockscreen-login-box@eDP-1" = {
              box_height = 196.0;
              box_width = 810.0;
              cx = 853.5;
              cy = 796.5;
              output = "eDP-1";
              placement_height = 1067.0;
              placement_width = 1707.0;
              rotation = 0.0;
              type = "login_box";
              settings = {
                center_password_text = false;
                layout = "regular";
                show_caps_lock = true;
                show_keyboard_layout = true;
                show_login_button = true;
                show_media = true;
                show_session_buttons = true;
                show_unlock_hint = true;
                show_weather = true;
              };
            };
          };
        };
        osd = {
          position = "bottom_center";
        };
        plugins = {
          enabled = ["noctalia/screen_recorder" "noctalia/translator" "piero-93/thinkpad-fan"];
          source = [
            {
              auto_update = true;
              kind = "git";
              location = "https://github.com/noctalia-dev/official-plugins";
              name = "official";
            }
            {
              auto_update = true;
              kind = "git";
              location = "https://github.com/noctalia-dev/community-plugins";
              name = "community";
            }
          ];
        };
        shell = {
          corner_radius_scale = 0.5;
          font_family = "MesloLGS Nerd Font";
          password_style = "random";
          polkit_agent = true;
          screen_time_enabled = true;
          settings_show_advanced = true;
          telemetry_enabled = true;
          ui_scale = 0.949999988079071;
          animation = {
            speed = 1.5500000715255735;
          };
          panel = {
            attach_clipboard = true;
            attach_control_center = false;
            session_placement = "centered";
            transparency_mode = "soft";
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
            builtin_ids = ["gtk4" "gtk3" "kitty" "qt" "kcolorscheme" "hyprland"];
            community_ids = ["spicetify" "pywalfox" "vscode"];
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
          recorder = {
            type = "noctalia/screen_recorder:recorder";
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
          widget = {
            type = "piero-93/thinkpad-fan:widget";
          };
          workspaces = {
            capsule = true;
            capsule_group = "buttons_left";
            label_source = "name";
          };
        };
      };
    };
  };
}
