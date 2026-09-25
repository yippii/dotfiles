{
  self,
  inputs,
  ...
}: {
  flake.homeModules.noctalia = {pkgs, ...}: {
    imports = [inputs.noctalia.homeModules.default];

    home.packages = with pkgs; [
      qalculate-qt
      bitwarden-cli
      glib
      kdePackages.kdeconnect-kde
      smartmontools
    ];

    programs.noctalia = {
      enable = true;
      settings = {
        accessibility = {
          high_contrast = false;
          ui_scale = 1.0;
        };
        audio = {
          enable_overdrive = false;
          enable_sounds = false;
          notification_sound = "";
          sound_volume = 0.5;
          volume_change_sound = "";
        };
        backdrop = {
          blur_intensity = 0.5;
          enabled = false;
          tint_intensity = 0.30000001192092896;
        };
        bar = {
          order = [ "default" ];
          default = {
            auto_hide = false;
            background_opacity = 0.699999988079071;
            border = "outline";
            border_width = 0.0;
            capsule = true;
            capsule_fill = "surface_variant";
            capsule_opacity = 0.0;
            capsule_padding = 6.0;
            capsule_radius = 5.0;
            capsule_thickness = 0.7599999904632568;
            center = [ "widget" "clock" "media" ];
            concave_edge_corners = true;
            contact_shadow = false;
            enabled = true;
            end = [ "group:g1" "group:g4" "clipboard" "control-center" "session" ];
            font_scale = 1.0;
            font_weight = 500;
            hover_highlight = true;
            layer = "overlay";
            margin_edge = 10;
            margin_ends = 260;
            margin_opposite_edge = 0;
            padding = 14;
            panel_overlap = 1;
            position = "top";
            radius = 38;
            radius_bottom_left = 38;
            radius_bottom_right = 38;
            radius_top_left = 38;
            radius_top_right = 38;
            reserve_space = false;
            scale = 1.0;
            shadow = true;
            show_on_workspace_switch = true;
            smart_auto_hide = true;
            start = [ "group:g3" "workspaces" ];
            thickness = 40;
            widget_spacing = 3;
            dead_zone = {
              
            };
            capsule_group = [ {
              accordion = false;
              accordion_direction = "end";
              enabled = true;
              fill = "surface_variant";
              id = "g1";
              members = [ "tray" ];
              opacity = 0.0;
              padding = 6.0;
              radius = 5.0;
            } {
              accordion = false;
              accordion_direction = "end";
              enabled = true;
              fill = "surface_variant";
              id = "g3";
              members = [ "launcher" "notifications" "bar" "status_2" ];
              opacity = 0.0;
              padding = 6.0;
              radius = 5.0;
            } {
              accordion = false;
              accordion_direction = "end";
              enabled = true;
              fill = "surface_variant";
              id = "g4";
              members = [ "recorder" "network" "warp_2" "bluetooth" "volume" "brightness" "battery" ];
              opacity = 0.0;
              padding = 6.0;
              radius = 5.0;
              widget_spacing = 10;
            } ];
          };
        };
        battery = {
          warning_threshold = 10;
        };
        brightness = {
          enable_ddcutil = false;
          ignore_mmids = [  ];
          minimum_brightness = 0.0;
          sync_all_monitors = false;
        };
        calendar = {
          enabled = true;
          event_date_format = "%A %e %B";
          event_time_format = "%H:%M";
          refresh_minutes = 15;
          account = {
            liboris20 = {
              calendars = [  ];
              color = "";
              credential_source = "secret-service";
              name = "Boris Li";
              password_file = "";
              path = "";
              provider = "";
              server_url = "";
              type = "google";
              username = "";
            };
          };
        };
        control_center = {
          hidden_tabs = [  ];
          show_session_button = true;
          show_shortcut_labels = false;
          sidebar = "compact";
          sidebar_section = "none";
          width = 800;
          calendar = {
            show_events_card = true;
            show_week_numbers = false;
          };
          shortcuts = [ {
            type = "wifi";
          } {
            type = "bluetooth";
          } {
            type = "caffeine";
          } {
            type = "notification";
          } {
            type = "power_profile";
          } ];
        };
        desktop_widgets = {
          enabled = true;
          schema_version = 1;
          widget_order = [ "desktop-widget-0000000000000002" "desktop-widget-0000000000000004" "desktop-widget-0000000000000005" "desktop-widget-0000000000000006" "desktop-widget-0000000000000007" ];
          grid = {
            cell_size = 8;
            major_interval = 4;
            visible = true;
          };
          widget = {
            desktop-widget-0000000000000002 = {
              box_height = 112.0;
              box_width = 192.0;
              cx = 1493.1458740234375;
              cy = 324.0;
              enabled = true;
              output = "eDP-1";
              placement_height = 1000.0;
              placement_width = 1600.0;
              rotation = 0.0;
              type = "weather";
              settings = {
                
              };
            };
            desktop-widget-0000000000000004 = {
              box_height = 112.0;
              box_width = 192.0;
              cx = 1493.1458740234375;
              cy = 444.0;
              enabled = true;
              output = "eDP-1";
              placement_height = 1000.0;
              placement_width = 1600.0;
              rotation = 0.0;
              type = "sysmon";
              settings = {
                stat = "cpu_usage";
                stat2 = "cpu_temp";
              };
            };
            desktop-widget-0000000000000005 = {
              box_height = 112.0;
              box_width = 192.0;
              cx = 1493.1458740234375;
              cy = 204.00001525878906;
              enabled = true;
              output = "eDP-1";
              placement_height = 1000.0;
              placement_width = 1600.0;
              rotation = 0.0;
              type = "volume";
              settings = {
                background = true;
                background_color = "surface";
                background_opacity = 0.8;
                background_padding = 2;
                background_radius = 12;
                device = "output";
                fill_color = "primary";
                font_family = "";
                glyph = "";
                scroll_step = 5;
                shadow = false;
                show_device = true;
                track_color = "secondary";
              };
            };
            desktop-widget-0000000000000006 = {
              box_height = 160.0;
              box_width = 368.0;
              cx = 507.55712890625;
              cy = 529.9906005859375;
              enabled = true;
              output = "eDP-1";
              placement_height = 1000.0;
              placement_width = 1600.0;
              rotation = 0.0;
              type = "media_player";
              settings = {
                
              };
            };
            desktop-widget-0000000000000007 = {
              box_height = 64.0;
              box_width = 88.0;
              cx = 517.1865844726562;
              cy = 572.1905517578125;
              enabled = true;
              output = "eDP-1";
              placement_height = 1000.0;
              placement_width = 1600.0;
              rotation = 0.0;
              type = "audio_visualizer";
              settings = {
                background = false;
                bands = 32;
                show_when_idle = true;
              };
            };
          };
        };
        dock = {
          active_monitor_only = true;
          active_opacity = 0.8999999761581421;
          active_scale = 1.0;
          auto_hide = true;
          background_opacity = 0.3999999761581421;
          border = "outline";
          border_width = 0.0;
          concave_edge_corners = true;
          cross_axis_padding = 8;
          enabled = true;
          icon_size = 48;
          inactive_opacity = 0.8500000238418579;
          inactive_scale = 0.8500000238418579;
          item_spacing = 6;
          launcher_custom_image = "";
          launcher_custom_image_colorize = false;
          launcher_icon = "grid-dots";
          launcher_position = "start";
          layer = "top";
          magnification = true;
          magnification_scale = 1.4500000476837158;
          main_axis_padding = 16;
          margin_edge = 0;
          margin_ends = 0;
          monitors = [  ];
          pinned = [ "zen-beta" "org.kde.dolphin" "kitty" ];
          position = "bottom";
          radius = 10;
          radius_bottom_left = 10;
          radius_bottom_right = 10;
          radius_top_left = 10;
          radius_top_right = 10;
          reserve_space = false;
          shadow = true;
          show_dots = true;
          show_instance_count = true;
          show_running = true;
          smart_auto_hide = false;
        };
        hooks = {
          battery_charging = [  ];
          battery_discharging = [  ];
          battery_percentage_changed = [  ];
          battery_plugged = [  ];
          bluetooth_disabled = [  ];
          bluetooth_enabled = [  ];
          colors_changed = [  ];
          logging_out = [  ];
          power_profile_changed = [  ];
          rebooting = [  ];
          session_locked = [  ];
          session_unlocked = [  ];
          shutting_down = [  ];
          started = [  ];
          theme_mode_changed = [  ];
          wallpaper_changed = [  ];
          wifi_disabled = [  ];
          wifi_enabled = [  ];
        };
        hot_corners = {
          delay_ms = 0;
          enabled = false;
          bottom_left = {
            action = "none";
            command = "";
          };
          bottom_right = {
            action = "none";
            command = "";
          };
          top_left = {
            action = "none";
            command = "";
          };
          top_right = {
            action = "none";
            command = "";
          };
        };
        idle = {
          behavior_order = [ "lock" "screen-off" "suspend" ];
          pre_action_fade_seconds = 2.0;
          behavior = {
            lock = {
              action = "lock";
              command = "";
              enabled = true;
              locked_timeout = 0.0;
              resume_command = "";
              timeout = 1200.0;
            };
            screen-off = {
              action = "screen_off";
              command = "";
              enabled = false;
              locked_timeout = 0.0;
              resume_command = "";
              timeout = 660.0;
            };
            suspend = {
              action = "lock_and_suspend";
              command = "";
              enabled = false;
              locked_timeout = 0.0;
              resume_command = "";
              timeout = 900.0;
            };
          };
        };
        keybinds = {
          cancel = [ "Escape" ];
          copy = [ "Ctrl+c" ];
          delete = [ "Delete" ];
          down = [ "Down" ];
          left = [ "Left" ];
          right = [ "Right" ];
          save = [ "Ctrl+s" ];
          tab_next = [ "Tab" ];
          tab_previous = [ "Shift+ISO_Left_Tab" ];
          up = [ "Up" ];
          validate = [ "Return" "KP_Enter" "space" ];
        };
        location = {
          address = "";
          auto_locate = true;
          custom_schedule = false;
          sunrise = "";
          sunset = "";
        };
        lockscreen = {
          allow_empty_password = false;
          blur_intensity = 0.5399999618530273;
          blurred_desktop = true;
          enabled = true;
          fingerprint = true;
          lock_before_suspend = true;
          monitors = [  ];
          tint_intensity = 0.30000001192092896;
          wallpaper = "";
        };
        lockscreen_widgets = {
          enabled = true;
          schema_version = 1;
          widget_order = [ "lockscreen-login-box@WL-1" "lockscreen-widget-000000000000000c" "lockscreen-widget-000000000000001b" "lockscreen-widget-000000000000000a" "lockscreen-widget-000000000000000b" "lockscreen-widget-000000000000000e" "lockscreen-widget-0000000000000009" "lockscreen-widget-0000000000000001" "lockscreen-login-box@eDP-1" "lockscreen-widget-0000000000000003" "lockscreen-widget-0000000000000005" "lockscreen-widget-0000000000000008" "lockscreen-widget-000000000000000d" "lockscreen-widget-000000000000000f" "lockscreen-widget-0000000000000011" "lockscreen-widget-0000000000000012" "lockscreen-widget-0000000000000013" "lockscreen-widget-0000000000000014" "lockscreen-widget-0000000000000015" "lockscreen-widget-0000000000000016" "lockscreen-widget-0000000000000017" "lockscreen-widget-0000000000000018" "lockscreen-widget-0000000000000019" "lockscreen-widget-000000000000001a" "lockscreen-widget-000000000000001d" "lockscreen-widget-000000000000001e" "lockscreen-widget-000000000000001f" "lockscreen-widget-0000000000000020" "lockscreen-widget-0000000000000021" "lockscreen-widget-0000000000000022" "lockscreen-widget-0000000000000023" ];
          grid = {
            cell_size = 8;
            major_interval = 4;
            visible = true;
          };
          widget = {
            "lockscreen-login-box@WL-1" = {
              box_height = 196.0;
              box_width = 756.0;
              cx = 394.0;
              cy = 804.0;
              enabled = true;
              output = "WL-1";
              placement_height = 986.0;
              placement_width = 788.0;
              rotation = 0.0;
              type = "login_box";
              settings = {
                background_color = "surface_variant";
                background_opacity = 0.88;
                background_radius = 12.0;
                center_password_text = false;
                input_opacity = 1.0;
                input_radius = 6.0;
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
            "lockscreen-login-box@eDP-1" = {
              box_height = 150.0;
              box_width = 810.0;
              cx = 800.0;
              cy = 880.5555419921875;
              enabled = true;
              output = "eDP-1";
              placement_height = 1000.0;
              placement_width = 1600.0;
              rotation = 0.0;
              type = "login_box";
              settings = {
                background_color = "surface_variant";
                background_opacity = 0.88;
                background_radius = 32.0;
                center_password_text = true;
                input_opacity = 1.0;
                input_radius = 20.0;
                layout = "regular";
                show_caps_lock = true;
                show_keyboard_layout = true;
                show_login_button = true;
                show_media = true;
                show_session_buttons = false;
                show_unlock_hint = true;
                show_weather = true;
              };
            };
            lockscreen-widget-0000000000000001 = {
              box_height = 368.0;
              box_width = 464.0;
              cx = 793.75;
              cy = 434.57098388671875;
              enabled = true;
              output = "eDP-1";
              placement_height = 1000.0;
              placement_width = 1600.0;
              rotation = 0.0;
              type = "clock";
              settings = {
                background = true;
                background_color = "surface_variant";
                background_opacity = 0.87;
                background_radius = 32;
                center_text = true;
                clock_style = "digital";
                font_family = "Google Sans Flex";
                format = ''
      {:%H:%M}
      '';
                shadow = false;
              };
            };
            lockscreen-widget-0000000000000003 = {
              box_height = 32.0;
              box_width = 80.0;
              cx = 1324.3516845703125;
              cy = 905.7337036132812;
              enabled = true;
              output = "eDP-1";
              placement_height = 1000.0;
              placement_width = 1600.0;
              rotation = 0.2617993950843811;
              type = "label";
              settings = {
                background = false;
                background_color = "on_surface";
                background_opacity = 1.0;
                background_radius = 0;
                font_family = "Google Sans Flex";
                shadow = false;
                title = "Locked, lol";
              };
            };
            lockscreen-widget-0000000000000005 = {
              box_height = 112.0;
              box_width = 208.0;
              cx = 689.75;
              cy = 528.0;
              enabled = true;
              output = "eDP-1";
              placement_height = 1000.0;
              placement_width = 1600.0;
              rotation = 0.0;
              type = "volume";
              settings = {
                background = true;
                background_color = "on_secondary";
                background_opacity = 0.5;
                background_radius = 9;
                shadow = false;
              };
            };
            lockscreen-widget-0000000000000008 = {
              box_height = 24.0;
              box_width = 328.0;
              cx = 790.0;
              cy = 429.629638671875;
              enabled = true;
              output = "eDP-1";
              placement_height = 1000.0;
              placement_width = 1600.0;
              rotation = 0.0;
              type = "clock";
              settings = {
                background = false;
                background_color = "shadow";
                center_text = false;
                color = "on_surface";
                font_family = "JetBrains Mono Nerd Font Extralight";
                format = "{:%a,  %b  %d}";
                shadow = false;
              };
            };
            lockscreen-widget-0000000000000009 = {
              box_height = 374.9442443847656;
              box_width = 475.6770324707031;
              cx = 792.1561279296875;
              cy = 438.9049987792969;
              enabled = true;
              output = "eDP-1";
              placement_height = 1000.0;
              placement_width = 1600.0;
              rotation = -0.1333654522895813;
              type = "label";
              settings = {
                background_color = "outline";
                background_opacity = 1.0;
                background_radius = 32;
                shadow = false;
                title = " ";
              };
            };
            lockscreen-widget-000000000000000a = {
              box_height = 144.0;
              box_width = 800.0;
              cx = 786.6666259765625;
              cy = 892.5927124023438;
              enabled = true;
              output = "eDP-1";
              placement_height = 1000.0;
              placement_width = 1600.0;
              rotation = 0.0;
              type = "label";
              settings = {
                background_color = "on_secondary";
                background_radius = 20;
                shadow = false;
                title = " ";
              };
            };
            lockscreen-widget-000000000000000b = {
              box_height = 928.8473510742188;
              box_width = 2487.954833984375;
              cx = 609.0314331054688;
              cy = 0.0;
              enabled = true;
              output = "eDP-1";
              placement_height = 1000.0;
              placement_width = 1600.0;
              rotation = -0.27045175433158875;
              type = "label";
              settings = {
                background_color = "secondary";
                background_opacity = 0.39;
                shadow = false;
                title = " ";
              };
            };
            lockscreen-widget-000000000000000c = {
              box_height = 657.2086791992188;
              box_width = 2403.496826171875;
              cx = 0.0;
              cy = 1000.0;
              enabled = true;
              output = "eDP-1";
              placement_height = 1000.0;
              placement_width = 1600.0;
              rotation = -0.27045175433158875;
              type = "label";
              settings = {
                background = false;
                background_color = "on_secondary";
                background_opacity = 0.3;
                shadow = false;
                title = " ";
              };
            };
            lockscreen-widget-000000000000000d = {
              box_height = 152.0;
              box_width = 160.0;
              cx = 186.66665649414062;
              cy = 244.44444274902344;
              enabled = true;
              output = "eDP-1";
              placement_height = 1000.0;
              placement_width = 1600.0;
              rotation = 0.0;
              type = "label";
              settings = {
                background = false;
                background_opacity = 1.0;
                background_radius = 10;
                shadow = false;
                title = " ";
              };
            };
            lockscreen-widget-000000000000000e = {
              box_height = 152.0;
              box_width = 160.0;
              cx = 186.66665649414062;
              cy = 244.44444274902344;
              enabled = true;
              output = "eDP-1";
              placement_height = 1000.0;
              placement_width = 1600.0;
              rotation = 0.5235987901687622;
              type = "label";
              settings = {
                background = false;
                background_opacity = 1.0;
                background_radius = 10;
                shadow = false;
                title = " ";
              };
            };
            lockscreen-widget-000000000000000f = {
              box_height = 152.0;
              box_width = 160.0;
              cx = 186.66665649414062;
              cy = 244.44444274902344;
              enabled = true;
              output = "eDP-1";
              placement_height = 1000.0;
              placement_width = 1600.0;
              rotation = 1.0471975803375244;
              type = "label";
              settings = {
                background = false;
                background_opacity = 1.0;
                background_radius = 10;
                font_family = "";
                shadow = false;
                title = " ";
              };
            };
            lockscreen-widget-0000000000000011 = {
              box_height = 112.0;
              box_width = 112.0;
              cx = 1482.9188232421875;
              cy = 111.57168579101562;
              enabled = true;
              output = "eDP-1";
              placement_height = 1000.0;
              placement_width = 1600.0;
              rotation = 0.5235987901687622;
              type = "label";
              settings = {
                background = false;
                background_color = "on_tertiary";
                background_opacity = 1.0;
                background_radius = 20;
                color = "secondary";
                shadow = false;
                title = " ";
              };
            };
            lockscreen-widget-0000000000000012 = {
              box_height = 64.0;
              box_width = 64.0;
              cx = 1357.0115966796875;
              cy = 145.10923767089844;
              enabled = true;
              output = "eDP-1";
              placement_height = 1000.0;
              placement_width = 1600.0;
              rotation = -0.2617993950843811;
              type = "label";
              settings = {
                background_color = "surface_variant";
                background_opacity = 1.0;
                background_radius = 20;
                title = " ";
              };
            };
            lockscreen-widget-0000000000000013 = {
              box_height = 56.0;
              box_width = 56.0;
              cx = 1491.8739013671875;
              cy = 246.52658081054688;
              enabled = true;
              output = "eDP-1";
              placement_height = 1000.0;
              placement_width = 1600.0;
              rotation = 0.5235987901687622;
              type = "label";
              settings = {
                background_color = "on_primary";
                background_opacity = 1.0;
                background_padding = 0;
                background_radius = 32;
                title = " ";
              };
            };
            lockscreen-widget-0000000000000014 = {
              box_height = 96.0;
              box_width = 96.0;
              cx = 66.66666412353516;
              cy = 97.41874694824219;
              enabled = true;
              output = "eDP-1";
              placement_height = 1000.0;
              placement_width = 1600.0;
              rotation = 0.2617993950843811;
              type = "label";
              settings = {
                background_color = "outline";
                background_opacity = 1.0;
                background_padding = 0;
                background_radius = 20;
                title = " ";
              };
            };
            lockscreen-widget-0000000000000015 = {
              box_height = 56.0;
              box_width = 56.0;
              cx = 221.45941162109375;
              cy = 70.37036895751953;
              enabled = true;
              output = "eDP-1";
              placement_height = 1000.0;
              placement_width = 1600.0;
              rotation = 0.5235987901687622;
              type = "label";
              settings = {
                background = false;
                background_color = "on_secondary";
                background_opacity = 1.0;
                background_radius = 32;
                title = " ";
              };
            };
            lockscreen-widget-0000000000000016 = {
              box_height = 152.0;
              box_width = 800.0;
              cx = 800.0;
              cy = 694.571044921875;
              enabled = true;
              flip_y = true;
              output = "eDP-1";
              placement_height = 1000.0;
              placement_width = 1600.0;
              rotation = -3.1415927410125732;
              type = "audio_visualizer";
              settings = {
                background = false;
                bands = 32;
                centered = false;
                color_1 = "outline";
                color_2 = "on_primary";
                mirrored = true;
                reversed = true;
                show_when_idle = false;
              };
            };
            lockscreen-widget-0000000000000017 = {
              box_height = 0.0;
              box_width = 0.0;
              cx = 793.75;
              cy = 225.92591857910156;
              enabled = true;
              output = "eDP-1";
              placement_height = 1000.0;
              placement_width = 1600.0;
              rotation = 0.0;
              type = "label";
              settings = {
                background = false;
                color = "surface";
                font_family = "JetBrainsMono NF ExtraLight";
                shadow = false;
                title = "L   O   C   K   E   D";
              };
            };
            lockscreen-widget-0000000000000018 = {
              box_height = 40.0;
              box_width = 144.0;
              cx = 872.0000610351562;
              cy = 492.0;
              enabled = true;
              output = "eDP-1";
              placement_height = 1000.0;
              placement_width = 1600.0;
              rotation = 0.0;
              type = "button";
              settings = {
                background = true;
                color = "secondary";
                glyph = "noctalia";
                label = " Noctalia v5";
                variant = "ghost";
              };
            };
            lockscreen-widget-0000000000000019 = {
              box_height = 40.0;
              box_width = 128.0;
              cx = 856.1561279296875;
              cy = 523.25927734375;
              enabled = true;
              output = "eDP-1";
              placement_height = 1000.0;
              placement_width = 1600.0;
              rotation = 0.0;
              type = "button";
              settings = {
                background = true;
                color = "primary";
                glyph = "umbriel";
                hover_background = "hover";
                label = " Umbriel";
                variant = "ghost";
              };
            };
            lockscreen-widget-000000000000001a = {
              box_height = 32.0;
              box_width = 208.0;
              cx = 904.0;
              cy = 559.25927734375;
              enabled = true;
              output = "eDP-1";
              placement_height = 1000.0;
              placement_width = 1600.0;
              rotation = 0.0;
              type = "button";
              settings = {
                background = true;
                color = "on_secondary";
                glyph = "lock-filled";
                hover_background = "hover";
                label = " L'appareil est verrouillé   ";
                variant = "destructive";
              };
            };
            lockscreen-widget-000000000000001b = {
              box_height = 40.0;
              box_width = 808.0;
              cx = 790.6666259765625;
              cy = 784.0;
              enabled = true;
              output = "eDP-1";
              placement_height = 1000.0;
              placement_width = 1600.0;
              rotation = 0.0;
              type = "label";
              settings = {
                background_color = "on_secondary";
                background_radius = 15;
                title = " ";
              };
            };
            lockscreen-widget-000000000000001d = {
              box_height = 120.0;
              box_width = 120.0;
              cx = 206.66665649414062;
              cy = 211.1111297607422;
              enabled = true;
              output = "eDP-1";
              placement_height = 1000.0;
              placement_width = 1600.0;
              rotation = 0.0;
              type = "label";
              settings = {
                background = true;
                background_color = "surface";
                background_opacity = 1.0;
                background_radius = 12;
                shadow = false;
                title = "";
              };
            };
            lockscreen-widget-000000000000001e = {
              box_height = 120.0;
              box_width = 120.0;
              cx = 206.66665649414062;
              cy = 211.1111297607422;
              enabled = true;
              output = "eDP-1";
              placement_height = 1000.0;
              placement_width = 1600.0;
              rotation = -0.5235987901687622;
              type = "label";
              settings = {
                background = true;
                background_color = "surface";
                background_opacity = 1.0;
                background_radius = 12;
                shadow = false;
                title = "";
              };
            };
            lockscreen-widget-000000000000001f = {
              box_height = 120.0;
              box_width = 120.0;
              cx = 207.76710510253906;
              cy = 210.39442443847656;
              enabled = true;
              output = "eDP-1";
              placement_height = 1000.0;
              placement_width = 1600.0;
              rotation = -1.0471975803375244;
              type = "label";
              settings = {
                background = true;
                background_color = "surface";
                background_opacity = 1.0;
                background_radius = 12;
                shadow = false;
                title = "";
              };
            };
            lockscreen-widget-0000000000000020 = {
              box_height = 120.0;
              box_width = 120.0;
              cx = 1494.9681396484375;
              cy = 105.78584289550781;
              enabled = true;
              output = "eDP-1";
              placement_height = 1000.0;
              placement_width = 1600.0;
              rotation = -1.0471975803375244;
              type = "label";
              settings = {
                background = true;
                background_color = "on_tertiary";
                background_opacity = 1.0;
                background_radius = 12;
                shadow = false;
                title = "";
              };
            };
            lockscreen-widget-0000000000000021 = {
              box_height = 48.0;
              box_width = 48.0;
              cx = 265.1196594238281;
              cy = 88.58309936523438;
              enabled = true;
              output = "eDP-1";
              placement_height = 1000.0;
              placement_width = 1600.0;
              rotation = 0.5235987901687622;
              type = "label";
              settings = {
                background_color = "on_primary";
                background_opacity = 1.0;
                background_padding = 0;
                background_radius = 32;
                title = " ";
              };
            };
            lockscreen-widget-0000000000000022 = {
              box_height = 0.0;
              box_width = 0.0;
              cx = 1544.5;
              cy = 943.0;
              enabled = true;
              output = "eDP-1";
              placement_height = 1000.0;
              placement_width = 1600.0;
              rotation = 0.0;
              type = "yocraft/battery-widget:widget";
              settings = {
                hide_full = false;
                hide_plugged = false;
                label_content = "time";
                show_label = true;
              };
            };
            lockscreen-widget-0000000000000023 = {
              box_height = 136.0;
              box_width = 232.0;
              cx = 1334.3529052734375;
              cy = 819.7059326171875;
              enabled = true;
              output = "eDP-1";
              placement_height = 1000.0;
              placement_width = 1600.0;
              rotation = 0.2617993950843811;
              type = "sticker";
              settings = {
                background = false;
                image_path = "/home/yippie/Projects/dotfiles-private/talala.png";
                opacity = 1.0;
              };
            };
          };
        };
        nightlight = {
          enabled = false;
          force = false;
          temperature_day = 6500;
          temperature_night = 4000;
        };
        notification = {
          background_opacity = 0.5;
          border = true;
          collapse_on_dismiss = true;
          enable_daemon = true;
          history_retention_hours = 0;
          keep_dismissed_in_history = true;
          layer = "top";
          max_visible = 0;
          monitors = [  ];
          offset_x = 20;
          offset_y = 8;
          position = "top_right";
          scale = 1.0;
          show_actions = true;
          show_app_name = true;
        };
        osd = {
          background_opacity = 0.3999999761581421;
          border = true;
          enabled = true;
          monitors = [  ];
          offset_x = 20;
          offset_y = 8;
          orientation = "horizontal";
          position = "bottom_center";
          position_vertical = "top_center";
          scale = 1.0;
          kinds = {
            bluetooth = true;
            brightness = true;
            caffeine = true;
            dnd = true;
            keyboard_backlight = true;
            keyboard_layout = true;
            lock_keys = true;
            media = true;
            nightlight = true;
            power_profile = true;
            privacy = true;
            volume = true;
            volume_input = true;
            volume_output = true;
            wifi = true;
          };
        };
        plugin_settings = {
          "mindnbytes/nix-status" = {
            flake_dir = "/etc/nixos";
            nixos_configuration = "NixOS-P1";
            use_themed_logos = true;
          };
          "noctalia/bitwarden" = {
            login_placement = "attached";
            unlock_placement = "attached";
          };
        };
        plugins = {
          auto_update = "all";
          enabled = [ "noctalia/screen_recorder" "noctalia/translator" "piero-93/thinkpad-fan" "yocraft/battery-widget" "noctalia/bitwarden" "samuelskovbakke/calculator-plus" "levi/warp" "mindnbytes/nix-status" "rylos/tailnet" "noctalia/umbriel-companion" "noctalia/wallpaper_depth" ];
          source = [ {
            enabled = true;
            kind = "git";
            location = "https://github.com/noctalia-dev/official-plugins";
            name = "official";
          } {
            enabled = true;
            kind = "git";
            location = "https://github.com/noctalia-dev/community-plugins";
            name = "community";
          } ];
        };
        shell = {
          app_icon_colorize = false;
          avatar_path = "";
          button_borders = true;
          card_borders = true;
          clipboard_auto_paste = "auto";
          clipboard_confirm_clear_history = true;
          clipboard_enabled = true;
          clipboard_history_max_entries = 100;
          clipboard_image_action_command = "";
          clipboard_keep_from_closed_apps = true;
          corner_radius_scale = 0.5;
          date_format = "%A, %x";
          disable_mipmaps = false;
          external_ip_enabled = true;
          font_family = "MesloLGS Nerd Font";
          input_borders = true;
          launch_apps_as_systemd_services = false;
          launch_apps_custom_command = "";
          niri_overview_type_to_launch_enabled = false;
          offline_mode = false;
          password_style = "random";
          polkit_agent = true;
          popup_borders = true;
          popup_shadows = true;
          screen_time_enabled = true;
          settings_show_advanced = true;
          settings_window_translucent = false;
          setup_wizard_enabled = true;
          shared_gl_context = true;
          show_location = true;
          telemetry_enabled = true;
          time_format = "{:%H:%M}";
          umbriel_overview_type_to_launch_enabled = true;
          animation = {
            enabled = true;
            speed = 1.5500000715255737;
          };
          greeter_sync = {
            auto_sync = false;
          };
          keyboard_layout = {
            
          };
          launcher = {
            app_grid = false;
            auto_paste = "auto";
            categories = true;
            compact = false;
            fetch_exchange_rates = true;
            pinned = [  ];
            provider_prefix = "/";
            show_app_actions = false;
            show_app_origin_indicator = true;
            show_icons = true;
            sort_by_usage = true;
            dmenu = {
              
            };
          };
          mpris = {
            blacklist = [  ];
          };
          panel = {
            borders = true;
            clipboard_placement = "floating";
            clipboard_position = "center";
            control_center_placement = "attached";
            control_center_position = "top_right";
            floating_layer = "overlay";
            floating_offset = 8;
            launcher_placement = "floating";
            launcher_position = "center";
            list_item_background = false;
            open_near_click_clipboard = false;
            open_near_click_control_center = true;
            open_near_click_launcher = false;
            open_near_click_session = false;
            open_near_click_wallpaper = false;
            polkit_placement = "attached";
            polkit_position = "center";
            session_placement = "floating";
            session_position = "center";
            shadow = true;
            transparency_mode = "soft";
            wallpaper_placement = "attached";
            wallpaper_position = "auto";
          };
          privacy = {
            cam_filter_regex = "";
            mic_filter_regex = "";
            screen_filter_regex = "";
          };
          screen_corners = {
            enabled = true;
            size = 30;
          };
          screenshot = {
            annotate = false;
            close_on_copy = true;
            close_on_save = true;
            confirm_region = false;
            copy_to_clipboard = true;
            directory = "";
            filename_pattern = "";
            freeze_screen = true;
            pipe_command = "";
            pipe_to_command = false;
            remember_last_region = false;
            save_to_file = true;
            show_cursor = false;
            skip_annotate_on_copy_save = false;
          };
          session = {
            grid = false;
            grid_columns = 5;
            show_shortcuts = true;
            power = {
              
            };
            actions = [ {
              action = "lock";
              command = "";
              countdown_seconds = 0.0;
              enabled = true;
              glyph = "";
              label = "";
              shortcut = "1";
              variant = "default";
            } {
              action = "logout";
              command = "";
              countdown_seconds = 0.0;
              enabled = true;
              glyph = "";
              label = "";
              shortcut = "2";
              variant = "default";
            } {
              action = "lock_and_suspend";
              command = "";
              countdown_seconds = 0.0;
              enabled = true;
              glyph = "";
              label = "";
              shortcut = "3";
              variant = "default";
            } {
              action = "reboot";
              command = "";
              countdown_seconds = 0.0;
              enabled = true;
              glyph = "";
              label = "";
              shortcut = "4";
              variant = "default";
            } {
              action = "shutdown";
              command = "";
              countdown_seconds = 0.0;
              enabled = true;
              glyph = "";
              label = "";
              shortcut = "5";
              variant = "destructive";
            } ];
          };
          shadow = {
            alpha = 0.3999999761581421;
            direction = "down";
          };
          window_switcher = {
            mru = false;
          };
        };
        storage = {
          key_file = "";
          key_source = "secret-service";
        };
        system = {
          monitor = {
            cpu_freq_activity_threshold = 2.5;
            cpu_freq_critical_threshold = 4.5;
            cpu_poll_seconds = 2.0;
            cpu_temp_activity_threshold = 60.0;
            cpu_temp_critical_threshold = 85.0;
            cpu_temp_sensor_path = "";
            cpu_usage_activity_threshold = 50.0;
            cpu_usage_critical_threshold = 90.0;
            disk_free_activity_threshold = 80.0;
            disk_free_critical_threshold = 95.0;
            disk_free_pct_activity_threshold = 80.0;
            disk_free_pct_critical_threshold = 95.0;
            disk_poll_seconds = 10.0;
            disk_used_activity_threshold = 80.0;
            disk_used_critical_threshold = 95.0;
            disk_used_pct_activity_threshold = 80.0;
            disk_used_pct_critical_threshold = 95.0;
            enabled = true;
            gpu_poll_seconds = 5.0;
            gpu_temp_activity_threshold = 60.0;
            gpu_temp_critical_threshold = 85.0;
            gpu_usage_activity_threshold = 50.0;
            gpu_usage_critical_threshold = 95.0;
            gpu_vram_activity_threshold = 50.0;
            gpu_vram_critical_threshold = 90.0;
            memory_poll_seconds = 2.0;
            net_rx_activity_threshold = 1.0;
            net_rx_critical_threshold = 50.0;
            net_tx_activity_threshold = 1.0;
            net_tx_critical_threshold = 50.0;
            network_poll_seconds = 3.0;
            ram_pct_activity_threshold = 60.0;
            ram_pct_critical_threshold = 90.0;
            swap_pct_activity_threshold = 20.0;
            swap_pct_critical_threshold = 80.0;
          };
        };
        theme = {
          builtin = "Noctalia";
          community_palette = "Oxocarbon";
          custom_palette = "";
          mode = "dark";
          pure_black_dark = false;
          shell_mode = "follow";
          source = "wallpaper";
          wallpaper_scheme = "m3-fruit-salad";
          templates = {
            builtin_ids = [ "gtk3" "gtk4" "hyprland" "kcolorscheme" "kitty" "qt" "umbriel" ];
            community_ids = [ "spicetify" "vscode" ];
            enable_builtin_templates = true;
            enable_community_templates = true;
            user = {
              base16 = {
                compare_to = "";
                enabled = true;
                hook_async = true;
                index = 0;
                input_path = "$XDG_CONFIG_HOME/noctalia/base16/base16.yaml";
                output_path = [ "$XDG_CONFIG_HOME/noctalia/base16/base16_generated.yaml" ];
                output_path_dynamic = "";
                post_action = "";
                post_hook = "";
                pre_hook = "";
              };
            };
          };
        };
        wallpaper = {
          directory = "/home/yippie/Pictures/Wallpapers";
          directory_dark = "";
          directory_light = "";
          edge_smoothness = 0.30000001192092896;
          enabled = true;
          fill_color = "";
          fill_mode = "crop";
          per_monitor_directories = false;
          transition = [ "fade" "wipe" "disc" "stripes" "zoom" "honeycomb" ];
          transition_duration = 1500.0;
          transition_on_startup = false;
          automation = {
            enabled = false;
            interval_seconds = 1800;
            order = "random";
            recursive = true;
          };
        };
        weather = {
          effects = true;
          enabled = true;
          refresh_minutes = 30;
          unit = "metric";
        };
        widget = {
          active_window = {
            icon_size = 14.0;
            max_length = 260.0;
            min_length = 80.0;
            title_scroll = "none";
            type = "active_window";
          };
          bar = {
            type = "noctalia/umbriel-companion:bar";
          };
          bar_2 = {
            type = "rylos/tailnet:bar";
          };
          bar_3 = {
            type = "noctalia/umbriel-companion:bar";
          };
          bar_4 = {
            type = "noctalia/wallpaper_depth:bar";
          };
          battery = {
            capsule = true;
            type = "battery";
          };
          brightness = {
            capsule = true;
            show_label = false;
            type = "brightness";
          };
          clipboard = {
            capsule = true;
            type = "clipboard";
          };
          clock = {
            capsule = true;
            type = "clock";
          };
          control-center = {
            capsule = true;
            type = "control-center";
          };
          cpu = {
            stat = "cpu_usage";
            type = "sysmon";
          };
          date = {
            format = "{:%a %d %b}";
            type = "clock";
          };
          input_volume = {
            device = "input";
            type = "volume";
          };
          keyboard_layout = {
            hide_when_single_layout = false;
            type = "keyboard_layout";
          };
          launcher = {
            capsule = true;
            glyph = "rocket";
            type = "launcher";
          };
          lock_keys = {
            display = "short";
            hide_when_off = false;
            show_caps_lock = true;
            show_num_lock = true;
            show_scroll_lock = false;
            type = "lock_keys";
          };
          media = {
            album_art_only = true;
            art_size = 16.0;
            capsule = true;
            hide_artist = true;
            max_length = 800;
            min_length = 80.0;
            show_progress = true;
            title_scroll = "none";
            type = "media";
          };
          network = {
            capsule = true;
            show_label = false;
            type = "network";
          };
          network_rx = {
            stat = "net_rx";
            type = "sysmon";
          };
          network_tx = {
            stat = "net_tx";
            type = "sysmon";
          };
          notifications = {
            capsule = true;
            type = "notifications";
          };
          output_volume = {
            device = "output";
            type = "volume";
          };
          ram = {
            stat = "ram_used";
            type = "sysmon";
          };
          recorder = {
            type = "noctalia/screen_recorder:recorder";
          };
          session = {
            capsule = true;
            type = "session";
          };
          spacer = {
            interactive = false;
            type = "spacer";
          };
          status = {
            type = "mindnbytes/nix-status:status";
          };
          status_2 = {
            type = "mindnbytes/nix-status:status";
          };
          temp = {
            stat = "cpu_temp";
            type = "sysmon";
          };
          tray = {
            capsule = true;
            type = "tray";
          };
          volume = {
            capsule = true;
            show_label = false;
            type = "volume";
          };
          warp = {
            type = "levi/warp:warp";
          };
          warp_2 = {
            type = "levi/warp:warp";
          };
          widget = {
            type = "piero-93/thinkpad-fan:widget";
          };
          workspaces = {
            capsule = true;
            capsule_opacity = 0.0;
            capsule_radius = 10;
            label_source = "name";
            type = "workspaces";
          };
        };
      };
    };
  };
}
