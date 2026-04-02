require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "java_language_server", "nixd" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
