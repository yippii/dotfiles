{self, inputs, ...}: {
  flake.homeModules.desktop = {pkgs, ...}: {
    programs.kitty = {
      enable = true;
      settings = {
        font_family = "MesloLGS Nerd Font";
        bold_font = "auto";
        italic_font = "auto";
        bold_italic_font = "auto";
        font_size = 13.0;

        hide_window_decorations = "titlebar-only";
        background_opacity = 0.8;
        background_blur = 15;

        tab_bar_edge = "bottom";
        tab_bar_style = "powerline";
        tab_powerline_style = "round";
        tab_bar_min_tabs = 2;
        active_tab_font_style = "bold";
        inactive_tab_font_style = "normal";

        window_margin_width = 5;
        initial_window_width  = 960;
        initial_window_height = 310;

        shell = "fish";
      };

      extraConfig = "include themes/noctalia.conf";
    };
  };
}
