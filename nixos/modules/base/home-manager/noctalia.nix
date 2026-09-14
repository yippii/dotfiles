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
            center = [ "widget" "group:g2" ];
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
              members = [ "tray" "recorder" ];
              opacity = 0.0;
              padding = 6.0;
              radius = 5.0;
            } {
              accordion = false;
              accordion_direction = "end";
              enabled = true;
              fill = "surface_variant";
              id = "g2";
              members = [ "clock" "media" ];
              opacity = 0.0;
              padding = 6.0;
              radius = 5.0;
            } {
              accordion = false;
              accordion_direction = "end";
              enabled = true;
              fill = "surface_variant";
              id = "g3";
              members = [ "launcher" "notifications" ];
              opacity = 0.0;
              padding = 6.0;
              radius = 5.0;
            } {
              accordion = false;
              accordion_direction = "end";
              enabled = true;
              fill = "surface_variant";
              id = "g4";
              members = [ "network" "bluetooth" "volume" "brightness" "battery" ];
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
          show_shortcut_labels = true;
          sidebar = "compact";
          sidebar_section = "compact";
          width = 700;
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
            type = "nightlight";
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
            visible = false;
          };
          widget = {
            desktop-widget-0000000000000002 = {
              box_height = 112.0;
              box_width = 192.0;
              cx = 1593.0;
              cy = 369.5;
              enabled = true;
              output = "eDP-1";
              placement_height = 1067.0;
              placement_width = 1707.0;
              rotation = 0.0;
              type = "weather";
              settings = {
                
              };
            };
            desktop-widget-0000000000000004 = {
              box_height = 112.0;
              box_width = 192.0;
              cx = 1593.0;
              cy = 501.5;
              enabled = true;
              output = "eDP-1";
              placement_height = 1067.0;
              placement_width = 1707.0;
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
              cx = 1593.0;
              cy = 237.5;
              enabled = true;
              output = "eDP-1";
              placement_height = 1067.0;
              placement_width = 1707.0;
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
              cx = 541.5;
              cy = 565.5;
              enabled = true;
              output = "eDP-1";
              placement_height = 1067.0;
              placement_width = 1707.0;
              rotation = 0.0;
              type = "media_player";
              settings = {
                
              };
            };
            desktop-widget-0000000000000007 = {
              box_height = 64.0;
              box_width = 88.0;
              cx = 551.7734375;
              cy = 610.52734375;
              enabled = true;
              output = "eDP-1";
              placement_height = 1067.0;
              placement_width = 1707.0;
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
          active_opacity = 1.0;
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
          pinned = [ "zen-beta" "dolphin" "kitty" ];
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
          widget_order = [ "lockscreen-login-box@eDP-1" ];
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
              enabled = true;
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
          
        };
        plugins = {
          auto_update = "all";
          enabled = [ "noctalia/screen_recorder" "noctalia/translator" "piero-93/thinkpad-fan" ];
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
          external_ip_enabled = false;
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
            control_center_placement = "floating";
            control_center_position = "top_right";
            floating_layer = "overlay";
            floating_offset = 8;
            launcher_placement = "floating";
            launcher_position = "center";
            list_item_background = false;
            open_near_click_clipboard = false;
            open_near_click_control_center = false;
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
            builtin_ids = [ "gtk4" "gtk3" "kitty" "qt" "kcolorscheme" "hyprland" ];
            community_ids = [ "spicetify" "pywalfox" "vscode" ];
            enable_builtin_templates = true;
            enable_community_templates = true;
            user.base16 = {
              input_path = "$XDG_CONFIG_HOME/noctalia/base16/base16.yaml";
              output_path = "$XDG_CONFIG_HOME/noctalia/base16/base16_generated.yaml";
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
          battery = {
            capsule = true;
            type = "battery";
          };
          brightness = {
            capsule = true;
            capsule_group = "brightness+vol";
            show_label = false;
            type = "brightness";
          };
          clipboard = {
            capsule = true;
            capsule_group = "buttons_right";
            type = "clipboard";
          };
          clock = {
            capsule = true;
            capsule_group = "buttons_mid";
            type = "clock";
          };
          control-center = {
            capsule = true;
            capsule_group = "buttons_right";
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
            capsule_group = "buttons_left";
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
            art_size = 16.0;
            capsule = true;
            capsule_group = "buttons_mid";
            max_length = 800;
            min_length = 80.0;
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
            capsule_group = "buttons_left";
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
            capsule_group = "buttons_right";
            type = "session";
          };
          spacer = {
            interactive = false;
            type = "spacer";
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
            capsule_group = "brightness+vol";
            show_label = false;
            type = "volume";
          };
          widget = {
            type = "piero-93/thinkpad-fan:widget";
          };
          workspaces = {
            capsule = true;
            capsule_group = "buttons_left";
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
