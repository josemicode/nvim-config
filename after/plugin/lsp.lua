--local lsp = require('lsp-zero')
--local lsc = require('lspconfig')
--local msn = require('mason-lspconfig')
--local cmp = require('cmp')
--local snp = require('luasnip')

--lsp.preset('recommended')
----lsp.ensure_installed --> Deprecated
--msn.setup({
--	ensure_installed = {
--		'clangd',
--		'pyright',
--		'html',
--		'gopls',
--	}	
--})

---- Keymapping
--local cmp_select = {behavior = cmp.SelectBehavior.Select}
--local cmp_mappings = lsp.defaults.cmp_mappings({
--	['<C-a>'] = cmp.mapping.select_prev_item(cmp_select),
--	['<C-s>'] = cmp.mapping.select_next_item(cmp_select),
--	['<C-y>'] = cmp.mapping.confirm({ select = true }),
--	['<C-Space>'] = cmp.mapping.complete(),
--})

----lsp.setup_nvim_cmp({ mapping = cmp_mappings }) --> Deprecated

--cmp.setup({ 
--	snippet = { 
--		expand = function(args) 
--			snp.lsp_expand(args.body)
--		end, 
--	}, 
--	completion = {
--		autocomplete = false,
--	},
--	mapping = cmp_mappings, 
--	sources = { 
--		{ name = 'nvim_lsp' }, 
--		{ name = 'vsnip' }, 
--		{ name = 'buffer' }, 
--	} 
--})

---- Attach Servers
--local on_attach = function(client, bufnr)
--	local opts = { noremap=true, silent=true }
--	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
--	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
--end

--lsc.clangd.setup({ on_attach = on_attach })
--lsc.html.setup({ on_attach = on_attach })
---- lsc.gopls.setup({ 
---- 	on_attach = on_attach,
---- 	settings = {
---- 		gopls = {
---- 			usePlaceholders = true,  -- enable placeholder support for function parameters
---- 			analyses = {
---- 				unusedparams = true,  -- enable analysis of unused parameters
---- 			},
---- 		},
---- 	},
---- })
--lsc.gopls.setup({
--	cmd = {'gopls'},
--	-- for postfix snippets and analyzers
--	capabilities = capabilities,
--	settings = {
--		gopls = {
--			experimentalPostfixCompletions = true,
--			analyses = {
--				unusedparams = true,
--				shadow = true,
--			},
--			staticcheck = true,
--		},
--	},
--	on_attach = on_attach,
--})


--lsp.setup()


----rename local to lsp_zero
----lsp_zero.on_attach(function(client, bufnr)
--	--lsp_zero.default_keymaps({buffer = bufnr})
----end)
---

local lsp = require('lsp-zero')
lsp.preset('recommended')

local lspconfig = require('lspconfig')

-- Override Mason-lspconfig defaults (disable automatic setup)
-- require('mason-lspconfig').setup({
--   ensure_installed = { 'clangd', 'pyright', 'html', 'gopls' },
--   automatic_setup = false,  -- This disables the problematic automatic calls.
-- })

-- -- Prevent lsp-zero from automatically configuring these servers.
-- lsp.skip_server_setup({ 'clangd', 'pyright', 'html', 'gopls' })

local servers = { "clangd", "pyright", "html", "gopls" }
for _, server in ipairs(servers) do
	lspconfig[server].setup({})
end

local cmp = require('cmp')
local snp = require('luasnip')

local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-a>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-s>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ['<C-Space>'] = cmp.mapping.complete(),
})

cmp.setup({
  snippet = {
    expand = function(args)
      snp.lsp_expand(args.body)
    end,
  },
  completion = {
    autocomplete = false,
  },
  mapping = cmp_mappings,
  sources = {
    { name = 'nvim_lsp' },
    { name = 'buffer' },
  },
})

local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
end


lspconfig.clangd.setup({ on_attach = on_attach })
lspconfig.html.setup({ on_attach = on_attach })

local capabilities = lsp.capabilities
lspconfig.gopls.setup({
  cmd = { 'gopls' },
  capabilities = capabilities,
  settings = {
    gopls = {
      experimentalPostfixCompletions = true,
      analyses = {
        unusedparams = true,
        shadow = true,
      },
      staticcheck = true,
    },
  },
  on_attach = on_attach,
})

lsp.setup()

