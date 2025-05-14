local M = {}

function M.setup()
	require("noice").setup({
		-- Disable the default messages UI (prevents popups / toast messages)
		messages = {
			enabled = false,  -- This disables the in-buffer messages popup view.
		},
		-- Optionally, add a route filter to skip any notify events
		routes = {
			{
				filter = { event = "notify" },
				opts = { skip = true },
			},
		},
		-- Adjust presets to keep the UI minimal and avoid unwanted popups
		presets = {
			bottom_search = true,         -- Use the classic bottom command-line for search
			command_palette = true,       -- Keep the cmdline and popupmenu separated
			long_message_to_split = true,    -- Route long messages to a split instead of a popup
			inc_rename = false,            -- Disable the incremental rename dialog popup
			lsp_doc_border = false,        -- Remove borders from LSP hover docs
		},
		-- Additional configuration can be added here as you see fit
	})
end

return M
