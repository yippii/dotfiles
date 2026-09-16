{
  self,
  inputs,
  ...
}: {
  flake.homeModules.umbriel = {pkgs, ...}: {
    imports = [inputs.umbriel.homeModules.default];

    programs.umbriel = {
      enable = true;

      settings = {
        general = {
          autostart = ["noctalia"];
          mod_key = "Super";
        };

        include = {
          optional.files = [
            "noctalia.toml"
          ];
        };

        output.eDP-1 = {
          enabled = true; # False removes the output but preserves its state
          mode = "2560x1600@165"; # WIDTHxHEIGHT or WIDTHxHEIGHT@HZ
          scale = 1.6; # Logical size is mode size divided by scale
          transform = "normal"; # normal, 90, 180, 270, or a flipped variant
          vrr = "fullscreen"; # disabled, always, or fullscreen
          tearing = true; # Permit eligible fullscreen asynchronous flips
          direct_scanout = true; # False forces composition on this output
          hdr = "auto"; # off, on, auto, or fullscreen
          sdr_white = 203; # SDR reference white in cd/m2 during HDR
          workspace_axis = "horizontal"; # vertical or horizontal workspace arrangement
          min_workspaces = 7;
        };

        input = {
          cursor = {
            theme = "catppuccin-macchiato-dark-cursors";
            size = 24;
            hardware_cursor = true;
            follows_focus = true;
          };

          mouse = {
            natural_scroll = false;
            sensitivity = 0.0;
            scroll_wheel_step = 60;
          };

          touchpad = {
            natural_scroll = true;
            accel_profile = "flat";
            sensitivity = 1;
            scroll_factor = 1;
            disable_while_typing = true;
            click_method = "clickfinger";
          };

          focus = {
            follows_mouse = true;
          };
        };

        layout = {
          mode = "dwindle";
          gap = 5;
          dwindle.preserve_split = true;
        };

        window_rule = [
          {
            blur = true;
            blur_optimized = false;
          }

          {
            match.app_id = "zen-beta";
            default_workspace = 1;
            default_focused = true;
          }

          {
            match.app_id = "discord";
            default_workspace = 2;
            default_focused = false;
          }

          {
            match.app_id = "quodlibet";
            default_workspace = 3;
            default_focused = true;
          }

          {
            match.app_id = "code";
            default_workspace = 4;
            default_focused = true;
            opacity = 0.90;
            blur = true;
            blur_popups = false;
          }

          {
            match.app_id = "org.vinegarhq.Sober";
            default_workspace = 5;
          }

          {
            match.app_id = "kitty";
            default_workspace = 6;
            default_focused = true;
            blur = true;
          }

          {
            match.app_id = "^(Emulator|zenity|xdg-desktop-portal|qalculate-gtk|org\\.pulseaudio\\.pavucontrol)$";
            default_floating = true;
          }

          {
            match.title = "^(Open File|Select|Choose a wallpaper|Open Folder|Save As|Library|Choose Where to Download|File Operation Progress|Rename|Copy Files|Move Files|Search Files)";
            default_floating = true;
          }

          {
            match.xdg_tag = "^proton-game$";
            default_fullscreen = true;
          }

          {
            match.app_id = "dev.noctalia.*";
            default_floating = true;
            blur = true;
            blur_optimized = false;
            opacity = 0.90;
          }
        ];

        layer_rule = [
          {
            match.namespace = "^noctalia-(bar-[^\"]+|notification|dock|panel|attached-panel|osd|desktop-widget-[^\"]*)$";
            blur = true;
            blur_optimized = false;
            blur_ignore_alpha = 0.5;
            blur_popups = true;
          }
        ];

        animation = {
          workspaces = {
            enabled = true;
            duration_ms = 250;
            curve = "easeout";
          };

          overview = {
            enabled = true;
            duration_ms = 250;
            curve = "easeout";
            workspace_curve = "spring:1,1000";
          };
        };

        keybinds = {
          "Mod+T" = "spawn:app2unit kitty";
          "Mod+E" = "spawn:app2unit dolphin";
          "Mod+Shift+E" = "spawn:app2unit code";
          "Mod+Q" = "window-close";
          "Mod+F" = "spawn:app2unit zen-beta";
          "Mod+L" = "spawn:systemctl suspend";
          "Mod+S" = "spawn:~/.config/hypr/screenshot.sh";

          "Mod+R" = "spawn:noctalia msg panel-toggle launcher";
          "Mod+C" = "spawn:noctalia msg panel-toggle control-center";
          "Mod+Shift+C" = "cheatsheet-toggle";
          "Mod+Comma" = "spawn:noctalia msg settings-toggle";
          "Ctrl+Alt+Delete" = "spawn:noctalia msg panel-toggle session";
          "Ctrl+Alt+Shift+Q" = "spawn:pkill noctalia; sleep 0.5; noctalia";

          "Mod+O" = {
            action = "overview-toggle";
            repeat = false;
          };

          "Mod+V" = "window-toggle-floating";
          "Mod+Space" = "window-toggle-maximize";
          "Mod+Shift+Space" = "window-toggle-fullscreen";

          "Mod+Left" = "window-focus-left";
          "Mod+Down" = "window-focus-down";
          "Mod+Up" = "window-focus-up";
          "Mod+Right" = "window-focus-right";
          "Mod+Shift+Left" = "column-move-left";
          "Mod+Shift+Down" = "window-move-down";
          "Mod+Shift+Up" = "window-move-up";
          "Mod+Shift+Right" = "column-move-right";

          "Mod+1" = "workspace-switch:1";
          "Mod+2" = "workspace-switch:2";
          "Mod+3" = "workspace-switch:3";
          "Mod+4" = "workspace-switch:4";
          "Mod+5" = "workspace-switch:5";
          "Mod+6" = "workspace-switch:6";
          "Mod+7" = "workspace-switch:7";
          "Mod+8" = "workspace-switch:8";
          "Mod+9" = "workspace-switch:9";
          "Mod+0" = "workspace-switch:10";
          "Mod+Shift+1" = "window-move-to-workspace:1";
          "Mod+Shift+2" = "window-move-to-workspace:2";
          "Mod+Shift+3" = "window-move-to-workspace:3";
          "Mod+Shift+4" = "window-move-to-workspace:4";
          "Mod+Shift+5" = "window-move-to-workspace:5";
          "Mod+Shift+6" = "window-move-to-workspace:6";
          "Mod+Shift+7" = "window-move-to-workspace:7";
          "Mod+Shift+8" = "window-move-to-workspace:8";
          "Mod+Shift+9" = "window-move-to-workspace:9";
          "Mod+Shift+0" = "window-move-to-workspace:10";

          "Insert" = "spawn:app2unit quodlibet";

          "Ctrl+F1" = {
            action = "spawn:noctalia msg volume-mute";
            allow_when_locked = true;
          };

          "Ctrl+F2" = {
            action = "spawn:noctalia msg volume-down";
            allow_when_locked = true;
          };

          "Ctrl+F3" = {
            action = "spawn:noctalia msg volume-up";
            allow_when_locked = true;
          };

          "Ctrl+F5" = {
            action = "spawn:noctalia msg brightness-down";
            allow_when_locked = true;
          };

          "Ctrl+F6" = {
            action = "spawn:noctalia msg brightness-up";
            allow_when_locked = true;
          };

          "XF86AudioMute" = {
            action = "spawn:noctalia msg volume-mute";
            allow_when_locked = true;
          };

          "XF86AudioLowerVolume" = {
            action = "spawn:noctalia msg volume-down";
            allow_when_locked = true;
          };

          "XF86AudioRaiseVolume" = {
            action = "spawn:noctalia msg volume-up";
            allow_when_locked = true;
          };

          "XF86MonBrightnessDown" = {
            action = "spawn:noctalia msg brightness-down";
            allow_when_locked = true;
          };

          "XF86MonBrightnessUp" = {
            action = "spawn:noctalia msg brightness-up";
            allow_when_locked = true;
          };
        };
      };
    };
  };
}
