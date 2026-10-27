{self, inputs, ...}: {
  flake.homeModules.desktop = {
    imports = [inputs.plasma-manager.homeModules.plasma-manager];
    programs.plasma = {
      enable = true;
      shortcuts = {};
      dataFile = {};
      configFile = {
        dolphinrc.DetailsMode.PreviewSize = 22;
        dolphinrc.General.ShowSelectionToggle = false;
        dolphinrc.General.ShowStatusBar = false;
        dolphinrc.General.ViewPropsTimestamp = "2026,4,20,20,25,2.7800000000000002";
        dolphinrc.IconsMode.MaximumTextLines = 1;
        dolphinrc.IconsMode.PreviewSize = 256;
        dolphinrc.InformationPanel.dateFormat = "ShortFormat";
        dolphinrc."KFileDialog Settings"."Places Icons Auto-resize" = false;
        dolphinrc."KFileDialog Settings"."Places Icons Static Size" = 16;
        dolphinrc."MainWindow/Toolbar mainToolBar".ToolButtonStyle = "IconOnly";
        dolphinrc.PlacesPanel.IconSize = 16;
        dolphinrc.PreviewSettings.Plugins = "appimagethumbnail,audiothumbnail,comicbookthumbnail,cursorthumbnail,djvuthumbnail,ebookthumbnail,exrthumbnail,imagethumbnail,jpegthumbnail,kraorathumbnail,windowsexethumbnail,windowsimagethumbnail,opendocumentthumbnail,svgthumbnail,ffmpegthumbs";
        dolphinrc."Toolbar mainToolBar".ToolButtonStyle = "IconOnly";
        kdeglobals.General.Name = "noctalia";
        kdeglobals.General.TerminalApplication = "kitty";
        kdeglobals.General.widgetStyle = "Oxygen";
        kdeglobals.Icons.Theme = "Papirus-Dark";
        kdeglobals.KDE.contrast = 4;
        kdeglobals."KFileDialog Settings"."Allow Expansion" = false;
        kdeglobals."KFileDialog Settings"."Automatically select filename extension" = true;
        kdeglobals."KFileDialog Settings"."Breadcrumb Navigation" = true;
        kdeglobals."KFileDialog Settings"."Decoration position" = 2;
        kdeglobals."KFileDialog Settings"."Show Full Path" = false;
        kdeglobals."KFileDialog Settings"."Show Inline Previews" = true;
        kdeglobals."KFileDialog Settings"."Show Preview" = false;
        kdeglobals."KFileDialog Settings"."Show Speedbar" = true;
        kdeglobals."KFileDialog Settings"."Show hidden files" = false;
        kdeglobals."KFileDialog Settings"."Sort by" = "Name";
        kdeglobals."KFileDialog Settings"."Sort directories first" = true;
        kdeglobals."KFileDialog Settings"."Sort hidden files last" = false;
        kdeglobals."KFileDialog Settings"."Sort reversed" = false;
        kdeglobals."KFileDialog Settings"."Speedbar Width" = 188;
        kdeglobals."KFileDialog Settings"."View Style" = "DetailTree";
        kdeglobals.WM.activeBackground = "0,78,96";
        kdeglobals.WM.activeBlend = "182,235,255";
        kdeglobals.WM.activeForeground = "182,235,255";
        kdeglobals.WM.inactiveBackground = "16,19,28";
        kdeglobals.WM.inactiveBlend = "193,197,221";
        kdeglobals.WM.inactiveForeground = "193,197,221";
        kiorc.Confirmations.ConfirmDelete = true;
        kiorc.Confirmations.ConfirmEmptyTrash = true;
      };
    };
  };
}
