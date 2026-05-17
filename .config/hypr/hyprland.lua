-- Startup applications
hl.on("hyprland.start", function()
	hl.exec_cmd("noctalia")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("easyeffects --gapplication-service")
end)

-- Configs
require("env")
require("keybinds")
require("rules")
require("general")
require("noctalia")
dofile("/home/yippie/.config/hypr/noctalia.lua")
