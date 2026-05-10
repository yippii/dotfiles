vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

require("nvim-tree").setup({
	sort = {
		sorter = "name",
	},
	view = {
		width = "20%",
	},
	renderer = {
		group_empty = true,
	},
	actions = {
		open_file = {
			quit_on_open = false,
		},
	},
})
