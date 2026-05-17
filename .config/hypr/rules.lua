hl.window_rule({
	name = "web",

	match = {
		class = "firefox|zen.*",
	},

	workspace = 1,
})

hl.window_rule({
	name = "communication",

	match = {
		class = "discord|equibop|vesktop|whatsapp",
	},

	workspace = 2,
})

hl.window_rule({
	name = "music",

	match = {
		class = "feishin|Spotify|Supersonic|io.github.quodlibet.QuodLibet",
		title = "Spotify( Free)?",
	},

	workspace = 3,
})

hl.window_rule({
	name = "IDE",

	match = {
		class = "code",
	},

	workspace = 4,
})

hl.window_rule({
	name = "Games",

	match = {
		class = "steam*|Quaver|org.vinegarhq.Sober",
		title = "Sober|Wuthering Waves|Endfield.exe|GRYPHLINK|HELLDIVERS.*|Strinova.*",
	},

	workspace = 5,
	fullscreen = 1,
})

hl.window_rule({ name = "Terminal", match = { class = "kitty" }, workspace = 6 })

hl.window_rule({ name = "Floaties", match = { class = "xdg-desktop-portal-gtk", float = true } })

-- XWayland dragging fix
hl.window_rule({
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})
