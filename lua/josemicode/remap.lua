vim.g.mapleader = " " -- <leader>
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- netrw

-- Move line
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { silent = true })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { silent = true })
