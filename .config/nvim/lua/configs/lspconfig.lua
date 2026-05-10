require("nvchad.configs.lspconfig").defaults()

local servers = { "bash-language-server", "nixd", "python-lsp-server", "stylua", "jdtls", "css-lsp", "html-lsp", "pyright", "lua-language-server"}
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
