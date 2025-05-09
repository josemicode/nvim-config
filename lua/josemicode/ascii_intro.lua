-- print("HHH")

local M = {}

function M.display_ascii_intro()
  if vim.fn.argc() == 0 then  -- Only do this if no file was passed.
    local config_path = vim.fn.stdpath("config")
    local art_file = config_path .. "/lua/josemicode/web_icon.txt"
    if vim.fn.filereadable(art_file) == 1 then
      -- Create a scratch buffer: listed = false, scratch = true.
      local buf = vim.api.nvim_create_buf(false, true)
      
      -- Read the ASCII art file into a table of lines.
      local lines = vim.fn.readfile(art_file)
      vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
      
      -- Set additional buffer options to make it dashboard-like.
      vim.api.nvim_buf_set_option(buf, 'buftype', 'nofile')
      vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')
      vim.api.nvim_buf_set_option(buf, 'swapfile', false)
      
      -- Display the scratch buffer in the current window.
      vim.api.nvim_set_current_buf(buf)
    end
  end
end

vim.api.nvim_create_autocmd("VimEnter", {
  callback = M.display_ascii_intro,
})

return M



