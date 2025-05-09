require("nvim-surround").setup({
	-- Configuration options (leave empty for default settings)
})
-- Normal Mode:

-- -ys[motion][char]: Add surrounding characters around the text covered by [motion].

-- -yss[char]: Add surrounding characters around the entire line.

-- -yS[motion][char]: Add surrounding characters and insert a new line.

-- -ySS[char]: Add surrounding characters around the line and insert a new line.

-- ds[char]: Delete surrounding characters specified by [char].

-- cs[old_char][new_char]: Change surrounding characters from [old_char] to [new_char].

--Visual Mode:

-- -S[char]: Surround the selected text with specified characters.

-- Insert Mode:

-- -<C-g>s[char]: Add surrounding characters to the text you are about to insert.

-- -<C-g>S[char]: Add surrounding characters with a newline for the text you are about to insert.
