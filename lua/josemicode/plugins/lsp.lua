
return {
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonLog", "MasonUpdate", "MasonInstallAll" },
    config = function()
      require("mason").setup()
      vim.keymap.set("n", "<leader>lm", "<cmd>Mason<cr>", { desc = "Open Mason" })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "pyright", "html", "ts_ls", "gopls" },
        automatic_installation = true,
      })
    end,
  },
  {
    "saghen/blink.cmp",
    version = "*",
    lazy = false,
    priority = 100,
    opts = {
      keymap = { preset = "default" },
      completion = {
        ghost_text = { enabled = true },
        trigger = {
          show_on_insert = false,
          show_on_keyword = true,
          show_on_trigger_character = false,
        },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "saghen/blink.cmp",
    },
    config = function()
      -- Diagnostic configuration
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        update_in_insert = false,
        underline = true,
        severity_sort = true,
        float = {
          focusable = false,
          style = "minimal",
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
      })

      -- Get capabilities from blink.cmp
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local ok, blink_cmp = pcall(require, "blink.cmp")
      if ok and blink_cmp.get_lsp_capabilities then
        capabilities = blink_cmp.get_lsp_capabilities()
      end

      -- Add formatting capabilities
      capabilities.textDocument = capabilities.textDocument or {}
      capabilities.textDocument.formatting = true
      capabilities.textDocument.rangeFormatting = true

      -- Configure LSP servers using vim.lsp.config directly
      local servers = { "pyright", "html", "ts_ls", "gopls" }

      for _, server in ipairs(servers) do
        -- Load server configuration from nvim-lspconfig's lsp directory
        -- This avoids loading the deprecated require('lspconfig') framework
        local config_ok, server_config = pcall(require, "lspconfig.lsp." .. server)

        if config_ok and server_config then
          -- Merge with our capabilities
          local merged_config = vim.tbl_deep_extend("force", server_config, {
            capabilities = capabilities,
          })

          -- Use vim.lsp.config API (Neovim 0.11+)
          vim.lsp.config(server, merged_config)
        else
          -- Fallback minimal configuration
          local minimal_config = {
            capabilities = capabilities,
          }

          -- Basic filetype detection
          if server == "pyright" then
            minimal_config.filetypes = { "python" }
          elseif server == "html" then
            minimal_config.filetypes = { "html" }
          elseif server == "ts_ls" then
            minimal_config.filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" }
          elseif server == "gopls" then
            minimal_config.filetypes = { "go", "gomod", "gowork", "gotmpl" }
          end

          vim.lsp.config(server, minimal_config)
        end
      end

      -- LSP keybindings
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local bufnr = args.buf
          local client = vim.lsp.get_client_by_id(args.data.client_id)

          if not client then
            return
          end

          local opts = { buffer = bufnr, silent = true }

          -- Navigation
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

          -- Code actions & refactoring
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

          -- Formatting
          vim.keymap.set("n", "<leader>lf", function()
            vim.lsp.buf.format({ async = true })
          end, opts)

          -- Signature help
          vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts)

          -- Document symbols
          vim.keymap.set("n", "<leader>ls", vim.lsp.buf.document_symbol, opts)
          vim.keymap.set("n", "<leader>lw", vim.lsp.buf.workspace_symbol, opts)

          -- Diagnostic navigation
          vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
          vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
          vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)

          -- Diagnostic hover
          vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, opts)

          -- Quickfix list
          vim.keymap.set("n", "<leader>lc", function()
            vim.diagnostic.setqflist({ open = true })
          end, opts)
        end,
      })
    end,
  },
}
