-- local N = {}

-- function N.setup()
-- 	print("aaa")
-- 	require("neoscroll").setup({
-- 		-- Mappings that trigger the neoscroll animations.
-- 		mappings = { '<C-u>', '<C-d>', 'gg', 'G' },
-- 		hide_cursor = true,          -- Hide cursor while scrolling
-- 		stop_eof = true,             -- Stop at the end of the file
-- 		use_local_scrolloff = false, -- Use the local scrolloff value
-- 		respect_scrolloff = false,   -- Keep the scrolling offset independent of 'scrolloff'
-- 		cursor_scrolls_alone = true, -- The cursor will remain on screen even if the window cannot be scrolled further.
-- 		easing_function = nil,       -- Use the default easing function for scroll animation
-- 		pre_hook = nil,              -- Function to run before scrolling
-- 		post_hook = nil              -- Function to run after scrolling
-- 	})
-- end

-- return N
require("neoscroll").setup({
	mappings = {                 -- Keys to be mapped to their corresponding default scrolling animation
		'<C-u>', '<C-d>',
		'<C-b>', '<C-f>',
		'<C-y>',
		'zt', 'zz', 'zb',
		'gg',
	},
	hide_cursor = true,          -- Hide cursor while scrolling
	stop_eof = true,             -- Stop at <EOF> when scrolling downwards
	respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
	cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
	duration_multiplier = 0.5,   -- Global duration multiplier
	easing = 'quadratic',           -- Default easing function
	pre_hook = nil,              -- Function to run before the scrolling animation starts
	post_hook = nil,             -- Function to run after the scrolling animation ends
	performance_mode = false,    -- Disable "Performance Mode" on all buffers.
	ignored_events = {           -- Events ignored while scrolling
		'WinScrolled', 'CursorMoved'
	},
})
