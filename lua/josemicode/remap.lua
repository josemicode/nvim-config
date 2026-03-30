vim.g.mapleader = " " -- <leader>

local function map(mode, lhs, rhs, opts)
    opts = opts or { silent = true }
    vim.keymap.set(mode, lhs, rhs, opts)
end

-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- netrw
map("n", "<leader>pv", "<cmd>Oil<CR>")

-- Move line
map("n", "<A-j>", ":m .+1<CR>==")
map("n", "<A-k>", ":m .-2<CR>==")
