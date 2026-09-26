{
  self,
  inputs,
  ...
}: {
  flake.homeModules.zed = {pkgs, ...}: {
    programs.zed-editor = {
      enable = true;
      package = inputs.zed.packages.${pkgs.stdenv.hostPlatform.system}.default;
      extensions = ["nix" "toml" "elixir" "make" "java" "html" "latex"];

      userSettings = {
        vim_mode = true;

        minimap.show = "always";

        hour_format = "hour24";
        auto_update = false;

        # Tell Zed to use direnv and direnv can use a flake.nix environment
        load_direnv = "shell_hook";
        base_keymap = "VSCode";

        theme = "Noctalia Dark Transparent";

        terminal = {
          alternate_scroll = "off";
          blinking = "off";
          copy_on_select = false;
          dock = "bottom";
          detect_venv = {
            on = {
              directories = [".env" "env" ".venv" "venv"];
              activate_script = "default";
            };
          };
          env = {
            TERM = "kitty";
          };
          font_family = "MesloLGS Nerd Font";
          font_features = null;
          font_size = null;
          line_height = "comfortable";
          option_as_meta = false;
          button = false;
          shell = "system";
          toolbar = {
            title = true;
          };
          working_directory = "current_project_directory";
        };

        lsp = {
          rust-analyzer = {
            binary = {
              # path = lib.getExe pkgs.rust-analyzer;
              path_lookup = true;
            };
          };

          nix = {
            binary = {
              path_lookup = true;
            };
          };
        };

        show_whitespaces = "all";
        ui_font_family = "Noto Sans";
        ui_font_size = 16.0;
        buffer_font_size = 15.0;
      };
    };
  };
}
