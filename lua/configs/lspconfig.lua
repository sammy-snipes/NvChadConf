local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

-- Add this right after your imports at the top of the file
lspconfig.servers = {
	"lua_ls",
	"pyright",
	"nil_ls",
}

-- list of servers configured with default config.
-- local default_servers = { "pyright" }
local default_servers = {}

-- lsps with default config
for _, lsp in ipairs(default_servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		on_init = on_init,
		capabilities = capabilities,
	})
end

-- Nix language server configuration
lspconfig.nil_ls.setup({
	command = { "nil" },
	on_attach = on_attach,
	on_init = on_init,
	capabilities = capabilities,
	settings = {
		["nil"] = {
			formatting = {
				command = { "alejandra" },
			},
		},
	},
})

lspconfig.pyright.setup({
	on_attach = on_attach,
	on_init = on_init,
	capabilities = capabilities,

	settings = {
		python = {
			analysis = {
				typeCheckingMode = "off", -- Disable type checking diagnostics
			},
		},
	},
})

lspconfig.lua_ls.setup({
	on_attach = on_attach,
	on_init = on_init,
	capabilities = capabilities,

	settings = {
		Lua = {
			diagnostics = {
				enable = false, -- Disable all diagnostics from lua_ls
				-- globals = { "vim" },
			},
			workspace = {
				library = {
					vim.fn.expand("$VIMRUNTIME/lua"),
					vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
					vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types",
					vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
					"${3rd}/love2d/library",
				},
				maxPreload = 100000,
				preloadFileSize = 10000,
			},
		},
	},
})
