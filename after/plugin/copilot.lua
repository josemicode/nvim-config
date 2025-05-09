---11gcc when you're feeling dependent on AI completion :)
-- -- Disable Copilot's default Tab mapping
-- vim.g.copilot_no_tab_map = true
-- vim.g.copilot_assume_mapped = true

-- -- Insert mode: Accept Suggestion
-- vim.api.nvim_set_keymap("i", "<C-c>", 'copilot#Accept("<CR>")', { noremap = true, expr = true, silent = true })

-- -- Normal mode: Toggle Suggestion
-- vim.api.nvim_set_keymap("n", "<leader>ct", ":Copilot toggle<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<leader>ce", ":Copilot enable<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<leader>cd", ":Copilot disable<CR>", { noremap = true, silent = true })
