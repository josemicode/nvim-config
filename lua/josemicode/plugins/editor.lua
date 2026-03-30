return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { '<leader>pf', '<cmd>Telescope find_files<cr>', desc = 'Find files' },
      { '<C-p>', '<cmd>Telescope git_files<cr>', desc = 'Git files' },
      { '<leader>ps', '<cmd>Telescope live_grep<cr>', desc = 'Live grep' },
    },
    config = function()
      -- Telescope configuration if needed
    end,
  },
  {
    "theprimeagen/harpoon",
    keys = {
      { "<leader>a", function() require("harpoon.mark").add_file() end, desc = "Harpoon add file" },
      { "<C-e>", function() require("harpoon.ui").toggle_quick_menu() end, desc = "Harpoon menu" },
    },
  },
  {
    "stevearc/oil.nvim",
    cmd = { "Oil" },
    keys = {
      { "<leader>pv", "<cmd>Oil<CR>", desc = "Open Oil file explorer" },
    },
    opts = {
      view_options = { show_hidden = true }
    },
  },
  {
    "mbbill/undotree",
    cmd = { "UndotreeToggle", "UndotreeShow", "UndotreeHide", "UndotreeFocus" },
    config = function()
      -- Optional undotree config
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    config = function()
      require("nvim-treesitter.config").setup({
        ensure_installed = {
          "lua", "query", "markdown", "markdown_inline",
          "python", "go", "javascript", "typescript",
          "html", "css", "json", "yaml", "bash"
        },
        auto_install = true,
        highlight = { enable = true },
      })
    end,
  },
  {
    "tpope/vim-commentary",
    lazy = false,
  },
  {
    "kylechui/nvim-surround",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-surround").setup({})
    end,
  },
  {
    url = "https://codeberg.org/andyg/leap.nvim",
    keys = {
      { "s", mode = { "n", "x", "o" }, desc = "Leap forward" },
      { "S", mode = { "n", "x", "o" }, desc = "Leap backward" },
      { "gs", mode = { "n", "x", "o" }, desc = "Leap from anywhere" },
    },
    config = function()
      vim.keymap.set({'n', 'x', 'o'}, 's', '<Plug>(leap-forward)')
      vim.keymap.set({'n', 'x', 'o'}, 'S', '<Plug>(leap-backward)')
      vim.keymap.set('n', 'gs', '<Plug>(leap-from-window)')
      vim.keymap.set({'x', 'o'}, 'x', '<Plug>(leap-forward-till)')
      vim.keymap.set({'x', 'o'}, 'X', '<Plug>(leap-backward-till)')
    end,
  },
}
