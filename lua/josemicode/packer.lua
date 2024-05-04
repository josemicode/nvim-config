--) This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.6',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  } --Main file navigation system

  use 'shaunsingh/nord.nvim' --Winter-ish theme

  -- use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  use 'theprimeagen/harpoon' --File navigation Ctrl-binds

  use 'mbbill/undotree' --Shows branches that describe file changes

  use 'tpope/vim-fugitive'
end)
