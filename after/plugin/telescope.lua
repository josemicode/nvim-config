local builtin = require('telescope.builtin')
local lga = require('telescope').extensions.live_grep_args

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
--vim.keymap.set('n', '<leader>ps', function()
	--builtin.grep_string({ search = vim.fn.input("Grep > ")});
--end)
vim.keymap.set('n', '<leader>lg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>ps', lga.live_grep_args, {})
