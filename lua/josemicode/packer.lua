-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	--use {
		--	  'nvim-telescope/telescope.nvim', tag = '0.1.6',
		-- or                            , branch = '0.1.x',
		--	  requires = { {'nvim-lua/plenary.nvim'} }
		--} --Main file navigation system
		use { 'nvim-telescope/telescope.nvim',
		tag = '0.1.6',
		requires = { 
			{'nvim-lua/plenary.nvim'},
			{'nvim-telescope/telescope-live-grep-args.nvim'}
		},
		config = function()
			require('telescope').setup { 
				-- Your custom Telescope settings here
				defaults = { 
					-- Default configuration for Telescope goes here 
					-- config_key = value, 
				}, 
				-- Extend configuration by adding more keys 
			} 
			require('telescope').load_extension('live_grep_args') 
		end
	} --Main file navigation system

	use 'shaunsingh/nord.nvim' --Winter-ish theme

	use 'rose-pine/neovim' --Romantic theme

	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use('nvim-treesitter/playground')

	use 'theprimeagen/harpoon' --File navigation Ctrl-binds

	use 'mbbill/undotree' --Shows branches that describe file changes

	use 'tpope/vim-fugitive'

	use {
		-- Lang Servers
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			--- Uncomment the two plugins below if you want to manage the language servers from neovim
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			{'neovim/nvim-lspconfig'},
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'L3MON4D3/LuaSnip'},
		}
	}

	use {
		'williamboman/mason.nvim',
		config = function()
			require('mason').setup()
		end
	}

	use {
		'williamboman/mason-lspconfig.nvim',
		config = function()
			require('mason-lspconfig').setup()
		end
	}

	use 'tpope/vim-commentary' -- The holy gcc

	-- use 'github/copilot.vim'

	use 'kylechui/nvim-surround' -- Surround chars

	use 'Wansmer/treesj' -- Unpack/Join expressions

	use {
		'Febri-i/snake.nvim',
		requires = { 'Febri-i/fscreen.nvim' }
	}

	-- use 'zyedidia/vim-snake' -- New Snake...

	use {
		'alanfortlink/blackjack.nvim',
		requires = {'nvim-lua/plenary.nvim'},
		-- config = function()
			-- 	require("blackjack").setup()
			-- end
		}

		use 'ggandor/leap.nvim'
	end)
