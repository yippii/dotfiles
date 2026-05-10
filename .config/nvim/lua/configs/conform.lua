require("conform").setup({
  format_on_save = {
		-- These options will be passed to conform.format()
		-- timeout for 10s for mac where first exec of binary
		-- takes awhile
		timeout_ms = 10000,
		lsp_format = "fallback",
	},

	stop_after_first = true,
	notify_on_error = true,

	formatters_by_ft = {
		lua = { "stylua" },
		-- css = { "prettier" },
		-- html = { "prettier" }
	  python = { "black", "autoflake", "autopep8" },
		nix = { "alejandra" },
		java = { "google-java-format" },
	},

	default_format_opts = {
		lsp_format = "fallback",
	},
})
