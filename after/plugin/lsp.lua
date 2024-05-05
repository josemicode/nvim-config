
local lsp = require("lsp-zero")

lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({buffer = bufnr})
end)

lsp.preset("recommended")

require('mason').setup({})
require('mason-lspconfig').setup({
	-- Replace the language servers listed here
	-- with the ones you want to install
	ensure_installed = {
		'clangd',
		'pyright'
	},

	handlers = {
		function(server_name)
			require('lspconfig')[server_name].setup({})
		end,

		clangd = function()
			require('lspconfig').clangd.setup({
				cmd = {"clangd", "-background-index"},
				filetypes = {"c", "cpp", "objc", "objcpp"},
				root_dir = require('lspconfig').util.root_pattern(".git", "compile_commands.json", "build"),
				on_attach = function(client, bufnr)
					print('hello tsserver')
				end
			})
		end,
	}
})

