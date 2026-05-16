-- Wayland
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

-- QT
hl.env("QT_QPA_PLATFORM" ,"wayland")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

-- Cursors
hl.env("XCURSOR_THEME", "catppuccin-macchiato-dark-cursors")
hl.env("XCURSOR_SIZE", "24")

-- GTK
hl.env("GDK_SCALE", "1")
hl.env("GTK_THEME", "adw-gtk3-dark")
hl.env("GTK_ICON_THEME", "Papirus")

