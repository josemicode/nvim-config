local leap = require("leap")

-- Add the default mappings provided by leap.nvim.
leap.add_default_mappings()

-- For instance, remapping the forward/backward motions:
-- vim.keymap.set("n", "s", "<Plug>(leap-forward-to)", { remap = true })
-- vim.keymap.set("n", "S", "<Plug>(leap-backward-to)", { remap = true })

-- Customize options if needed:
-- leap.opts.case_sensitive = false
