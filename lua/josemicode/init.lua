
vim.g.mapleader = " " -- <leader>
vim.g.maplocalleader = " " -- <localleader>
vim.g.lspconfig_silent = 1

require("josemicode.lazy")
require("josemicode.remap")
require("josemicode.ascii_intro")

vim.opt.clipboard = 'unnamedplus'
vim.wo.number = true
vim.wo.relativenumber = true
